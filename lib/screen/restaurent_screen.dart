import 'package:flutter/material.dart';
import 'package:food_delevery/data/data.dart';
import 'package:food_delevery/model/food.dart';
import 'package:food_delevery/model/resturant.dart';
import 'package:food_delevery/widgets.dart/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  static const routeName = '/RestaurantScreen';
  final Restaurant restaurant;

  RestaurantScreen({required this.restaurant});
  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 175.0,
          width: 175.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(menuItem.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
                Colors.black54.withOpacity(0.3),
                Colors.black38.withOpacity(0.3),
              ],
              stops: [0.1, 0.6, 0.6, 0.9],
            ),
          ),
        ),
        Positioned(
          bottom: 70.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                menuItem.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$ ${menuItem.price}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30.0,
          right: 30.0,
          child: Container(
            width: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.restaurant.imageUrl,
                  child: Image(
                    height: 280.0,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(widget.restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 22.0),
                      ),
                      Text(
                        '0.2 mile away',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                    ],
                  ),
                  RatingStar(widget.restaurant.rating),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    widget.restaurant.address,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Review',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Contacct',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(10),
                crossAxisCount: 2,
                children: List.generate(widget.restaurant.menu.length, (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
