import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile/cart_page.dart';
import 'cart_provider.dart';
import 'cart_item.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final String image;

  const DetailPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late double price;
  int quantity = 1;
  double currentBasePrice = 0.0;
  String selectedSize = "Small";

  final Color primaryBrown = const Color(0xFF4B2E1E);
  final Color secondaryBrown = const Color(0xFF9E7D67);
  final Color accentBrown = const Color(0xFF774B31);
  final Color bgColor = const Color.fromARGB(255, 249, 248, 246);

  @override
  void initState() {
    super.initState();
    currentBasePrice = double.tryParse(widget.subtitle) ?? 0.0;
    price = currentBasePrice;
  }

  void updatePrice() {
    setState(() {
      price = currentBasePrice * quantity;
    });
  }

  void selectSize(String size) {
    setState(() {
      final original = double.tryParse(widget.subtitle) ?? 0.0;
      selectedSize = size;

      if (size == "Small") {
        currentBasePrice = original;
      } else if (size == "Medium") {
        currentBasePrice = original + 0.75;
      } else {
        currentBasePrice = original + 1.25;
      }

      updatePrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryBrown),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Coffee O'Clock",
          style: TextStyle(color: primaryBrown, fontWeight: FontWeight.bold),
        ),
          actions: [
  IconButton(
    icon: const Icon(Icons.shopping_cart),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CartPage()),
      );
    },
  ),
]
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Hero(
                    tag: widget.title,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.image,
                        height: screenHeight * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 28,
                      color: primaryBrown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: secondaryBrown),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 22,
                      color: primaryBrown,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _qtyBtn(Icons.remove_circle_outline, () {
                        if (quantity > 1) {
                          quantity--;
                          updatePrice();
                        }
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _qtyBtn(Icons.add_circle_outline, () {
                        quantity++;
                        updatePrice();
                      }),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Wrap(
                    spacing: 10,
                    children: [
                      _sizeBtn("Small"),
                      _sizeBtn("Medium"),
                      _sizeBtn("Large"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
     bottomNavigationBar: Padding(
  padding: const EdgeInsets.all(15),
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryBrown,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    onPressed: () {
      Provider.of<CartProvider>(context, listen: false).addToCart(
        CartItem(
          title: widget.title,
          image: widget.image,
          size: selectedSize,
          unitPrice: currentBasePrice,
          quantity: quantity,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Added to cart 🛒")),
      );
    },
    child: const Text(
      "Add to Cart",
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
  ),
),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return IconButton(
      icon: Icon(icon, color: primaryBrown, size: 30),
      onPressed: onTap,
    );
  }

  Widget _sizeBtn(String size) {
    final isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () => selectSize(size),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? accentBrown : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? accentBrown : const Color(0xFFEAEAEA),
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : primaryBrown,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
