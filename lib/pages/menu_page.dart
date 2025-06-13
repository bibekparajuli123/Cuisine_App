import 'package:flutter/material.dart';
import 'package:my_sushi_app/themes/app_colors.dart' show AppColors;
import '../components/food_tile.dart';
import '../components/app_drawer.dart';
import 'food_detail_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> menuItems = [
      {
        'name': 'Chicken Momo',
        'image': 'assets/images/chicken_momo.jpg',
        'price': '120',
        'rating': '4.7',
        'description': 'Juicy minced chicken wrapped in soft dough, steamed to perfection and served with spicy achar. A Nepali classic loved by all.',
      },
      {
        'name': 'Buff Momo',
        'image': 'assets/images/buff_momo.jpg',
        'price': '100',
        'rating': '4.6',
        'description': 'Traditional Nepali dumplings filled with flavorful buffalo meat, served hot with tangy dipping sauce.',
      },
      {
        'name': 'Veg Momo',
        'image': 'assets/images/momo_one.png',
        'price': '80',
        'rating': '4.5',
        'description': 'Steamed dumplings filled with fresh vegetables and spices, perfect for vegetarians craving authentic taste.',
      },
      {
        'name': 'Steam Momo',
        'image': 'assets/images/momo_two.png',
        'price': '100',
        'rating': '4.6',
        'description': 'Classic steamed momos with your choice of filling, soft and delicious with every bite.',
      },
      {
        'name': 'Thukpa',
        'image': 'assets/images/thukpa.jpg',
        'price': '180',
        'rating': '4.8',
        'description': 'A hearty Himalayan noodle soup with vegetables and meat, flavored with Nepali spices. Comfort in a bowl.',
      },
      {
        'name': 'Chowmein',
        'image': 'assets/images/chowmein.jpg',
        'price': '70',
        'rating': '4.4',
        'description': 'Stir-fried noodles tossed with vegetables, spices, and your choice of meat. A street food favorite.',
      },
      {
        'name': 'Sadheko',
        'image': 'assets/images/sadheko.jpg',
        'price': '70',
        'rating': '4.3',
        'description': 'A spicy, tangy salad made with boiled potatoes, onions, and Nepali spices. Perfect as a side or snack.',
      },
      {
        'name': 'Sukuti',
        'image': 'assets/images/sukuti.jpg',
        'price': '150',
        'rating': '4.7',
        'description': 'Traditional dried and spiced meat, grilled and served with onions and chili. A true taste of Nepal.',
      },
      {
        'name': 'Jhol Momo',
        'image': 'assets/images/jhol_momo.jpg',
        'price': '150',
        'rating': '4.8',
        'description': 'Steamed momos served in a spicy, flavorful soup-like sauce. A Kathmandu specialty.',
      },
      {
        'name': 'Chicken Choila',
        'image': 'assets/images/chicken_choila.png',
        'price': '180',
        'rating': '4.6',
        'description': 'Smoky grilled chicken marinated with Nepali spices, onions, and coriander. A must-try appetizer.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "Welcome User",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      drawer: const AppDrawer(),
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Discount/Coupon Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.couponBg,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.primary, width: 1.2),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.discount, color: AppColors.primary, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Discount Available!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Apply coupon code MOMO10 for 10% off.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Coupon applied!")),
                      );
                    },
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Menu Items (Scrollable)
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return FoodTile(
                  foodName: item['name']!,
                  imagePath: item['image']!,
                  price: item['price']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailPage(
                          name: item['name']!,
                          imagePath: item['image']!,
                          price: item['price']!,
                          rating: item['rating']!,
                          description: item['description']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            // Already on Home
          } else if (index == 1) {
            Navigator.pushNamed(context, '/cart');
          }
        },
      ),
    );
  }
}
