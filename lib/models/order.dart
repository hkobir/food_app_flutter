import 'package:food_app/models/restaurant.dart';

import 'food.dart';

class Order {
  Restaurant restaurant;
  Food food;
  String date;
  int quantity;

  Order(this.restaurant, this.food, this.date, this.quantity);
}
