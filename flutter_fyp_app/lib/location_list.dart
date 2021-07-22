import 'package:flutter/material.dart';
import 'package:flutter_fyp_app/location_detail.dart';
import 'package:flutter_fyp_app/repository/location_repository.dart';
import 'models/location.dart';

class LocationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LocationListState();
}

class _LocationListState extends State<LocationList> {
  Future<List<Location>> futureLocations;
  LocationRepository locationRepository = new LocationRepository();

  @override
  void initState() {
    super.initState();
    futureLocations = locationRepository.fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          );
        }),
        title: Text('Locations'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: this.futureLocations,
        builder: _listViewItemBuilder,
      ),
    );
  }

  Widget _listViewItemBuilder(
      BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
    if (snapshot.hasData) {
      var locations = snapshot.data;
      return ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            //leading: _itemThumbnail(location),
            title: _itemTitle(locations[index]),
            onTap: () => _navigationToLocationDetail(context, locations[index]),
          );
        },
      );
    }
    return SizedBox();
  }

  void _navigationToLocationDetail(BuildContext context, Location location) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(location)));
  }

  Widget _itemTitle(Location location) {
    return Text(
      location.name,
    );
  }
}
