class LocationIQAddress {
  final String postcode;

  LocationIQAddress({this.postcode});

  factory LocationIQAddress.fromJson(Map<String, dynamic> json) {
    return LocationIQAddress(
      postcode: json["postcode"],
    );
  }
}
