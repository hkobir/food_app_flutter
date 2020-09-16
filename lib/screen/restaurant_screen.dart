import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      iconSize: 35,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ".2 mile away",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    widget.restaurant.address,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  "Reviews",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {},
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  "Contact",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Food Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 1.2),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(widget.restaurant.menu.length, (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildFoodMenu(food);
                })),
          )
        ],
      ),
    );
  }

  Widget _buildFoodMenu(Food food) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(food.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                    Colors.black26.withOpacity(0.3),
                  ],
                  stops: [
                    0.1,
                    0.2,
                    0.6,
                    0.9
                  ]),
            ),
          ),
          Positioned(
            bottom: 65,
            child: Column(
              children: [
                Text(
                  food.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${food.price}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Theme.of(context).primaryColor),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
