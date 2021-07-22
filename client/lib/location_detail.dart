import 'package:flutter/material.dart';
import 'models/location.dart';

class LocationDetail extends StatelessWidget {
  final Location location;

  LocationDetail(this.location);

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
          title: Text(location.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: _buildLocation(location),
        ));
  }

  Widget _buildLocation(Location location) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 200,
      height: 200,
      child: Center(
        child: Text(
          "Available Spots: \n ${location.status}",
          style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Colors.blue,
      ),
    );
  }
}
