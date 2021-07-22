class Location {
  final String name;
  final int status;

  Location({this.name, this.status});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json["name"], status: json["status"]);
  }
}
