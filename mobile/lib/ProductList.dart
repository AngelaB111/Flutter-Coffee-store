import 'package:flutter/material.dart';
import 'package:mobile/about.dart';
import 'package:mobile/Home1.dart';
import 'package:mobile/ProductListView.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  final List<Map<String, String>> products = [
    {
      "Title": "Iced Latte",
      "subtitle": "4.0",
      "description": "Chilled milk coffee",
      "Image": "assets/latte.png",
    },
    {
      "Title": "Frappe",
      "subtitle": "3.5",
      "description": "Smooth and chilled coffee",
      "Image": "assets/greek-frappe.png",
    },
    {
      "Title": "Coffee Milkshake",
      "subtitle": "4.5",
      "description": "Creamy milk coffee",
      "Image": "assets/coffee-milkshake.png",
    },
    {
      "Title": "Espresso",
      "subtitle": "2.0",
      "description": "Strong/bold espresso shot",
      "Image": "assets/espresso.png",
    },
    {
      "Title": "Coffee Beans",
      "subtitle": "13.0",
      "description": "Premium roasted beans",
      "Image": "assets/beans.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    const coffeeBrown = Color(0xFF4B2E1E); 
    const bgColor = Color.fromRGBO(250, 247, 242, 1);

    return Scaffold(
      backgroundColor: bgColor,
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        title: const Text(
          "Coffee O'Clock", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/cup1.png'),
        ),
        backgroundColor: Colors.transparent, 
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Home1(), 
            
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
              child: Text(
                "Our Menu",
                style: TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold, 
                  color: coffeeBrown
                ),
              ),
            ),

            Productlistview(products: products),

            const SizedBox(height: 10),
            const About(),
            const SizedBox(height: 30), 
          ],
        ),
      ),

      bottomNavigationBar: Container(
        color: coffeeBrown,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: const Text(
          "© 2025 Coffee O'Clock",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, letterSpacing: 1),
        ),
      ),
    );
  }
}