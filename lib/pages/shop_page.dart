import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile_page.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(shoe shoes) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoes);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Successful added!'),
              content: Text('Check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          //message
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Everyone flies..,some fly longer than others',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          //hoy picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Hot Picks ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                shoe shoes = value.getShoesList()[index];
                return ShoeTile(
                  onTap: () => addShoeToCart(shoes),
                  shoes: shoes,
                );
              },
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 5.0, left: 25, right: 25),
          //   child: Divider(
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}
