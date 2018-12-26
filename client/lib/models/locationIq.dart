class LocationIQAddress {
  final String postcode;
  final String country;
  final String city;
  final String cityDistrict;

  LocationIQAddress(
      {this.postcode, this.country, this.city, this.cityDistrict});

  factory LocationIQAddress.fromJson(Map<String, dynamic> json) {
    return LocationIQAddress(
      postcode: json["postcode"],
      country: json["country"],
      city: json["city"],
      cityDistrict: json["cityDistrict"],
    );
  }
}
