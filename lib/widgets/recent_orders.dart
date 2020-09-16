import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/models/order.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
          child: Text(
            "Recent Orders",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              // return Text(order.food.name);
              return _BuildRecentOrders(context, order);
            },
          ),
        )
      ],
    );
  }

  _BuildRecentOrders(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 320.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey[50])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    height: 100.0,
                    width: 100.0,
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //start the text from start horizontally
                      mainAxisAlignment: MainAxisAlignment.center,
                      //vertically center
                      children: [
                        Text(
                          order.food.name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          order.date,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Theme.of(context).primaryColor),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}
