import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final String categoryName;

  const MenuPage({super.key, required this.categoryName});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Define menu items for different categories
  final Map<String, List<Map<String, dynamic>>> _menuItemsByCategory = {
    'Fast Food': [
      {
        'title': 'Burger',
        'description': 'Juicy burger with crispy fries',
        'price': 9.99,
        'image': 'assets/images/burger.png'
      },
      {
        'title': 'Fries',
        'description': 'Crispy golden fries',
        'price': 3.99,
        'image': 'assets/images/fries.png'
      },
    ],
    'Pizza': [
      {
        'title': 'Pizza',
        'description': 'Delicious cheese pizza',
        'price': 12.99,
        'image': 'assets/images/pizza.png'
      },
    ],
    'Cafe': [
      {
        'title': 'Expresso',
        'description': 'Freshly brewed coffee',
        'price': 2.99,
        'image': 'assets/images/expresso.png'
      },
      {
        'title': 'Americano',
        'description': 'Freshly brewed black coffee',
        'price': 3.99,
        'image': 'assets/images/americano.png'
      },
      {
        'title': 'Cappuccino',
        'description': 'Fresh coffee',
        'price': 4.99,
        'image': 'assets/images/cappucino.png'
      },
      {
        'title': 'Iced Lattee',
        'description': 'Freshly brewed iced coffee',
        'price': 4.99,
        'image': 'assets/images/icedlattee.jpg'
      },
      {
        'title': 'Milk Coffee',
        'description': 'Fresh milk coffee',
        'price': 2.99,
        'image': 'assets/images/milkcoffee.jpg'
      },
      {
        'title': 'Cake',
        'description': 'Delicious chocolate cake',
        'price': 5.99,
        'image': 'assets/images/chocolatecake.png'
      },
      {
        'title': 'Chocolate Croissant',
        'description': 'Fresh tasty croissant',
        'price': 2.99,
        'image': 'assets/images/croissant.jpg'
      },
      {
        'title': 'Black Forest',
        'description': 'Freshly baked cake',
        'price': 0.99,
        'image': 'assets/images/blackforest.jpg'
      },
      {
        'title': 'Puff',
        'description': 'Creamy chocolate puff',
        'price': 0.5,
        'image': 'assets/images/chocolatepuff.jpg'
      },
    ],
    'Dessert': [
      {
        'title': 'Cookies',
        'description': 'Sweet butter cookies',
        'price': 0.99,
        'image': 'assets/images/cookies.png'
      },
      {
        'title': 'Chocolate Cake',
        'description': 'Chocolate cake with delicious taste',
        'price': 5.99,
        'image': 'assets/images/chocolatecake.png'
      },
      {
        'title': 'Cheese Pastry',
        'description': 'Creamy, tasty and delicious',
        'price': 0.59,
        'image': 'assets/images/cheesepastery.png'
      },
      {
        'title': 'Chocolate shake',
        'description': 'Shake with delicious taste',
        'price': 0.99,
        'image': 'assets/images/chocolateshake.png'
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Get the menu items for the selected category
    final menuItems = _menuItemsByCategory[widget.categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryName} Menu'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: menuItems.isNotEmpty
              ? menuItems
                  .map((item) => _buildMenuItem(
                        item['title'],
                        item['description'],
                        item['price'],
                        item['image'],
                      ))
                  .toList()
              : [
                  const Center(
                      child: Text('No items available for this category.'))
                ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      String title, String description, double price, String imageUrl) {
    // Initialize the item count for this item if it doesn't exist
    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
                fontSize: 18,
              ),
            ),
            subtitle: Text('${description} - \$${price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.deepOrange),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                const Text(
                  '0', // Update with the actual count if needed
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepOrange,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.deepOrange),
                  onPressed: () {
                    setState(() {
                      // Handle item addition logic here
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
