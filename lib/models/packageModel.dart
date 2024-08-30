import 'dart:convert';

class Package {
  final String title;
  final String price;
  final String desc;

  Package({
    required this.title,
    required this.price,
    required this.desc,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      title: json['title'],
      price: json['price'],
      desc: json['desc'],
    );
  }

  static List<Package> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString)['response'];
    return jsonList.map((json) => Package.fromJson(json)).toList();
  }
}
