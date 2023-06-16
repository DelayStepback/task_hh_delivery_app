import 'dart:convert';
import 'package:http/http.dart' as http;


class Category {
  String name;
  int id;
  String image_url;

  Category(this.id, this.name, this.image_url);

  factory Category.fromJson(dynamic json) {
    return Category(
        json['id'] as int, json['name'] as String, json['image_url'] as String);
  }
}


Future<List<Category>> fetchData() async {
  var url = Uri.parse('https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body)["сategories"];
    return jsonResponse.map<Category>((json) => Category.fromJson(json)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}