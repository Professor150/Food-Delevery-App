import 'package:flutter/material.dart';
import 'package:food_delevery/model/resturant.dart';

import '../data/data.dart';
import '../widgets.dart/rating_stars.dart';
import '../widgets.dart/recent_orders.dart';

import 'car_screen.dart';
import 'restaurent_screen.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  _buildResturants() {
    List<Widget> restaurnatList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurnatList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantScreen(
                restaurant: restaurant,
              ),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1, color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      height: 150.0,
                      width: 150.0,
                      image: AssetImage(
                        restaurant.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      RatingStar(restaurant.rating),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        restaurant.address,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '0.2 miles away',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(children: restaurnatList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delevery'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle,
            size: 20,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CartScreen()));
            },
            child: Text(
              'Cart(${currentUser.cart.length})',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        children: [
          TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  width: 0.8,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              hintText: 'Search Food or Resturants',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.clear),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Resturarnts',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                  ),
                ),
              ),
              _buildResturants(),
            ],
          ),
        ],
      ),
    );
  }
}
