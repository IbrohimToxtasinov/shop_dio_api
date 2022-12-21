class Receiver {
  Receiver({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  final String brandImage;
  final String name;
  final String location;

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      brandImage: json["brand_image"] as String? ?? "",
      name: json["name"] as String? ?? "",
      location: json["location"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "brand_image": brandImage,
        "name": name,
        "location": location,
      };
}
