import 'package:dsaproject/searchh.dart';
import 'package:flutter/material.dart';
import 'package:dsaproject/Screens/Cart%20screen/cartscreen.dart';
import 'package:dsaproject/Screens/Components/color.dart';
import 'package:dsaproject/Screens/Components/list.dart';
import 'package:dsaproject/Screens/Detail%20Screen/detailscreen.dart';
import 'package:dsaproject/Screens/Drawer/drawer.dart';
import 'package:dsaproject/Screens/Favorite/favorite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool isSelected = false ;
  bool isDescending = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: const Text("Home"),
          foregroundColor: Colors.orange,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoriteItem()),
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
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                });
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
            Container(
              margin: const EdgeInsets.all(20),
              height: 120,
              child: ListView.builder(
                itemCount: catlist.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return catergorycontainer(index);
                },
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                    itemCount: productlist.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return productcard(
                        index,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              product: productlist[index],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.white70,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Search()),
                    );
                  },
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert, color: Colors.orange))
              ],
            )));
  }

  Widget catergorycontainer(int index) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: white,
        boxShadow: boxshadow,
      ),
      height: 100,
      width: 200,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(catlist[index].img),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  catlist[index].name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  catlist[index].pieces,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productcard(int index, VoidCallback press) {
    return GestureDetector(
      onTap: press,
      child: Container(
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
                productlist[index].img,
              ),
            ),
            Align(
              alignment: const Alignment(-1, 1),
              child: Text(
                productlist[index].name,
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
                    setState(
                      () {
                        if (productlist[index].isselected) {
                          productlist[index].isselected = false;
                        } else {
                          productlist[index].isselected = true;
                        }
                        favoritelist.add(
                          productlist[index],
                        );
                      },
                    );
                  },
                  icon: productlist[index].isselected
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
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
                    "${productlist[index].discount}% off",
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(1, 0.6),
              child: Text(
                "\$${PriceList[index]}",
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
                    if (cartlist.contains(productlist[index]) &&
                        productlist[index].isselectedcart == true) {
                      cartlist.remove(productlist[index]);
                      productlist[index].isselectedcart = false;
                    } else {
                      cartlist.add(productlist[index]);

                      productlist[index].isselectedcart = true;
                    }
                  });
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: productlist[index].isselectedcart
                      ? Colors.orange
                      : Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
