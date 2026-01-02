import 'package:flutter/material.dart';

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
  final Color bgColor = const Color.fromRGBO(250, 247, 242, 1);

  @override
  void initState() {
    super.initState();
    currentBasePrice = double.tryParse(widget.subtitle) ?? 0.0;
    price = currentBasePrice;
  }

  void updatePrice(int q) {
    setState(() {
      price = currentBasePrice * q;
    });
  }

  void selectSize(String size) {
    setState(() {
      double original = double.tryParse(widget.subtitle) ?? 0.0;
      selectedSize = size;
      
      if (size == "Small") {
        currentBasePrice = original;
      } else if (size == "Medium") {
        currentBasePrice = original + 0.75;
      } else if (size == "Large") {
        currentBasePrice = original + 1.25;
      }
      price = currentBasePrice * quantity;
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
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: primaryBrown),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 5),
            Image.asset('assets/cup1.png', width: 30, height: 30),
            const SizedBox(width: 8),
            Text(
              "Coffee O'Clock",
              style: TextStyle(color: primaryBrown, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.image,
                      height: screenHeight * 0.3,
                      fit: BoxFit.contain,
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
                  const SizedBox(height: 12),
                  
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: secondaryBrown),
                  ),
                  const SizedBox(height: 25),
                  
                  Text(
                    "Price: \$${price.toStringAsFixed(2)}",
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
                      _buildQuantityBtn(Icons.remove_circle_outline, () {
                        if (quantity > 1) {
                          quantity--;
                          updatePrice(quantity);
                        }
                      }),
                      Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildQuantityBtn(Icons.add_circle_outline, () {
                        quantity++;
                        updatePrice(quantity);
                      }),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildSizeBtn("Small"),
                      _buildSizeBtn("Medium"),
                      _buildSizeBtn("Large"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: primaryBrown,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: const Text(
          "© 2025 Coffee O'Clock",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, letterSpacing: 1),
        ),
      ),
    );
  }

  Widget _buildQuantityBtn(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, color: primaryBrown, size: 30),
      onPressed: onPressed,
    );
  }

  Widget _buildSizeBtn(String size) {
    bool isSelected = selectedSize == size;
    return ElevatedButton(
      onPressed: () => selectSize(size),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? accentBrown : primaryBrown,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: isSelected ? 4 : 0,
      ),
      child: Text(size),
    );
  }
}