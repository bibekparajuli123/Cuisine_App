import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_sushi_app/themes/app_colors.dart' show AppColors;
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/cart_item.dart';

class FoodDetailPage extends StatelessWidget {
  final String name;
  final String imagePath;
  final String price;
  final String rating;
  final String description;

  const FoodDetailPage({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top: Back Button and Food Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      name,
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 26,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            // Food Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  height: 220,
                  width: 320,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 22),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Price and Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  Text(
                    "Rs. $price",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Icon(Icons.star, color: Colors.amber.shade700, size: 22),
                  Text(
                    rating,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  label: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addItem(
                      CartItem(
                        name: name,
                        imagePath: imagePath,
                        price: price,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("$name added to cart!")),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
