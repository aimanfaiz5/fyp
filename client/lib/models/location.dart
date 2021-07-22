class Location {
  final String name;
  final int status;

  Location({this.name, this.status});

  factory Location.fromJSON(Map<String, dynamic> json) {
    return Location(name: json['name'], status: int.tryParse(json['status']));
  }
}
