import 'package:flutter/material.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/models/order.dart';
import 'package:food_app/models/restaurant.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart(${currentUser.cart.length})",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black45),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: currentUser.cart.length + 1,
        //extra 1 item for our footer content
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          print("length: ${currentUser.cart.length} : index: $index\n");
          if (index < currentUser.cart.length) {
            //if cart is not empty

            Order cart = currentUser.cart[index];
            return _BuiltCart(cart);
          }
          //after whole list completed
          print("draw footer content");
          if (currentUser.cart.length > 0) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimate Delivery time",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "25 min.",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(0, 1), blurRadius: 10)
        ]),
        child: FlatButton(
          child: Text(
            "CheckOut",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _BuiltCart(Order cart) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(cart.food.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15)),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cart.food.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    cart.restaurant.name,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.8, color: Colors.black54)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "-",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          cart.quantity.toString(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "+",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            "\$${(cart.quantity * cart.food.price).toString()}",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
