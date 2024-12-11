class Geo {
/*
 "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
    }
*/
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lng": lng,
    };
  }
}
