class Plant {
  String id;
  String name;
  String image;
  String description;
  String price;
  String carelevel;
  String country;

  Plant(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.carelevel,
      required this.country});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        price: json['price'],
        carelevel: json['carelevel'],
        country: json['country']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['carelevel'] = carelevel;
    data['country'] = country;
    return data;
  }
}
