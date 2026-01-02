import 'package:flutter/material.dart';
import 'package:mobile/about.dart';
import 'package:mobile/Home1.dart';
import 'package:mobile/ProductListView.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  List<Map<String, String>> products = []; 
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    const String url =
        'https://coffee-store-backend-wmt5.onrender.com/items/details';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          products = data.map<Map<String, String>>((item) => {
                "Title": item['name'].toString(),
                "subtitle": item['price'].toString(),
                "description": item['description'].toString(),
                "Image": item['image'].toString(),
              }).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      debugPrint("Error fetching products: $e");
      setState(() => isLoading = false);
    }
  }

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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                        color: coffeeBrown,
                      ),
                    ),
                  ),

                  products.isEmpty
                      ? const Center(child: Text("No products found"))
                      : Productlistview(products: products),

                  const SizedBox(height: 10),
                  const About(),
                  const SizedBox(height: 30),
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
