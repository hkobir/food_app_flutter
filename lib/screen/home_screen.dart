import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/screen/cart_screen.dart';
import 'package:food_app/screen/restaurant_screen.dart';
import 'package:food_app/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.account_circle,
          color: Colors.black45,
          size: 30.0,
        ),
        title: Text("Food Hunter"),
        centerTitle: true,
        actions: [
          FlatButton(
            child: Text(
              "Cart(${currentUser.cart.length})",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen())),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 0.8, color: Theme.of(context).primaryColor)),
                  hintText: "Search food or restaurant",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  )),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                child: Text(
                  "NearBy Restaurant",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      letterSpacing: 1.2),
                ),
              )
            ],
          ),
          _Buildrestaurant(),
          //go recent_order page
        ],
      ),
    );
  }

  _Buildrestaurant() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>RestaurantScreen(restaurant:restaurant))),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1.0, color: Colors.grey[200])),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                      image: AssetImage(restaurant.imageUrl),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${restaurant.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${restaurant.address}",
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "2 miles away",
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }
}
