import 'package:food_app/models/food.dart';

class Restaurant{
String imageUrl, name, address, rating;
List <Food> menu;

Restaurant(this.imageUrl, this.name, this.address, this.rating, this.menu);
}