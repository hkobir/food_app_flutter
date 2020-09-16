// Food
import 'package:food_app/models/food.dart';
import 'package:food_app/models/order.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/models/user.dart';

final _burrito = Food(name: "Barrito", imageUrl: "assets/images/baritto.jpeg", price: 120.0);
final _steak = Food(name: "Steak", imageUrl: "assets/images/steak.jpeg", price: 180.0);
final _pasta = Food(name: "Pasta", imageUrl: "assets/images/pasta.jpeg", price: 130.0);
final _ramen = Food(name: "Ramen", imageUrl: "assets/images/ramen.webp", price: 110.0);
final _paneCake = Food(name: "Pane Cake", imageUrl: "assets/images/pane_cake.jpeg", price: 340.0);
final _burger = Food(name: "Burger", imageUrl: "assets/images/burger.jpeg", price: 120.0);
final _pizza = Food(name: "Pizza", imageUrl: "assets/images/pizza.jpeg", price: 120.0);
final _salmon = Food(name: "Salmon", imageUrl: "assets/images/salmon.jpeg", price: 120.0);

// Restaurant
final _restaurant0 = Restaurant("assets/images/r0.jpeg", "Restaurant 0", "200t New york", "5",
    [_steak, _pasta, _ramen, _salmon, _burger, _burrito]);
final _restaurant1 = Restaurant("assets/images/r1.jpeg", "Restaurant 1", "200t New folia", "3",
    [_steak, _pasta, _paneCake, _salmon, _burger, _burrito]);
final _restaurant2 = Restaurant("assets/images/r2.jpeg", "Restaurant 2", "200t New Comilla", "5",
    [_steak, _pasta, _ramen, _salmon, _burger, _burrito]);
final _restaurant3 = Restaurant("assets/images/r3.jpeg", "Restaurant 3", "200t New Chittagong", "2",
    [_steak, _pasta, _pizza, _salmon, _burger, _burrito]);
final _restaurant4 = Restaurant("assets/images/r4.jpeg", "Restaurant 4", "200t New Dhaka", "1",
    [_steak, _pasta, _pizza, _salmon, _burger, _burrito]);

final List<Restaurant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4,
];

// Users
final currentUser = User("John", [
  Order(
    _restaurant1,
    _burrito,
    "Oct 1st, 2020",
    4,
  ),
  Order(
    _restaurant4,
    _salmon,
    "Sept 2, 2020",
    3,
  ),
  Order(
    _restaurant3,
    _pasta,
    "Sept 2, 2020",
    4,
  ),
  Order(
    _restaurant2,
    _burger,
    "Sept 8, 2020",
    3,
  ),
],
    [
  Order(
    _restaurant1,
    _burrito,
    "Sept 2, 2020",
    4,
  ),
  Order(
    _restaurant2,
    _pizza,
    "Nov 8, 2020",
    2,
  ),
  Order(
    _restaurant3,
    _burger,
    "Sept 7, 2020",
    3,
  ),
  Order(
    _restaurant4,
    _salmon,
    "Sept 2, 2020",
    3,
  ),
  Order(
    _restaurant2,
    _pasta,
    "Sept 11, 2020",
    4,
  ),

]);
