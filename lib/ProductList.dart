import 'package:flutter/material.dart';
import 'package:mobile/About.dart';
import 'package:mobile/Home1.dart';
import 'package:mobile/ItemDetails.dart';
import 'package:mobile/ProductListView.dart';


class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  final List<Map<String, String>> Products = [
    {
      "Title": "Iced Latte",
      "subtitle": "4.0",
      "description": "Chilled milk coffee",
      "Image": "assets/latte.png"
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
    const coffeeBrown = Color(0xFF774B31);
    const cardColor = Color(0xFFDCC6B3);
    const titleColor = Color(0xFF4B2E1E);
    const subtitleColor = Color(0xFF7B5E4A);

    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee O'Clock", style: TextStyle(color: titleColor)),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/cup1.png'),
        ),
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Home1(),
                SizedBox(height: 20),
                Productlistview(products: Products),
                SizedBox(height: 20),
                About(),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        color: coffeeBrown,
        padding: const EdgeInsets.all(16),
        child: const Text(
          "© 2025 Coffee O'Clock",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
