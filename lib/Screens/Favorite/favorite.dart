import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Cart%20screen/cartscreen.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Components/list.dart';
import 'package:dsaproject/Screens/Drawer/drawer.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({Key? key}) : super(key: key);

  @override
  _FavoriteItemState createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  int indexselected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text("Favorite"),
        foregroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          Center(
            child: cartlist.length == 0
                ? Container(
                    width: 0,
                  )
                : Text(
                    cartlist.length.toString(),
                    style: const TextStyle(color: Colors.orange),
                  ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
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
                  itemCount: favoritelist.length,
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
              favoritelist[index].img,
            ),
          ),
          Align(
            alignment: const Alignment(-1, 1),
            child: Text(
              favoritelist[index].name,
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
                    favoritelist.removeAt(index);
                  });
                },
                icon: const Icon(
                  Icons.delete,
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
                  "${favoritelist[index].discount}% off",
                  style: TextStyle(color: white),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, 0.6),
            child: Text(
              "\$${favoritelist[index].price}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, 1),
            child: IconButton(
              onPressed: () {
                setState(() {
                  cartlist.add(
                    favoritelist[index],
                  );
                });
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.orange,
              ),
            ),
          )
        ],
      ),
    );
  }
}
