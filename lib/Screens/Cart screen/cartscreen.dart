import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Components/list.dart';
import 'package:dsaproject/Screens/Drawer/drawer.dart';
import 'package:dsaproject/Screens/Favorite/favorite.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text("Your Cart"),
        foregroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoriteItem()),
                );
              });
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          Center(
            child: cartlist.isEmpty
                ? Container(
                    width: 0,
                  )
                : Text(
                    cartlist.length.toString(),
                    style: const TextStyle(color: Colors.orange),
                  ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      drawer: const DrawerB(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                  itemCount: cartlist.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return productcard(index);
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget productcard(int index) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
        boxShadow: boxshadow,
      ),
      height: 300,
      width: 400,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 0),
            child: Image.asset(
              cartlist[index].img,
            ),
          ),
          Align(
            alignment: const Alignment(-1, 1),
            child: Text(
              cartlist[index].name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1, -1),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    cartlist.removeAt(index);
                    productlist[index].isselectedcart = false;
                  });
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.black,
                )),
          ),
          Align(
            alignment: const Alignment(1, -1),
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  "${cartlist[index].discount}% off",
                  style: TextStyle(color: white),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, 0.6),
            child: Text(
              "Price: \$${cartlist[index].price}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, 0.8),
            child: Text(
              "Discount: \$${cartlist[index].price * 30 / 100}",
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Align(
            alignment: const Alignment(1, 1),
            child: Text(
              "Total Price: \$${cartlist[index].price * 100 ~/ 30 * quantity}",
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Align(
            alignment: const Alignment(-1, 0.6),
            child: SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity < 1) {
                          quantity = quantity;
                        } else {
                          quantity = quantity - 1;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove,
                      color: black,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity = quantity + 1;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: black
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
