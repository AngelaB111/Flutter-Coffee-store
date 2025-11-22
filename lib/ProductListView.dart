import 'package:flutter/material.dart';
import 'package:mobile/ItemDetails.dart';

class Productlistview extends StatelessWidget {
  final List<Map<String, String>> products;

  Productlistview({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    const coffeeBrown = Color(0xFF774B31);
    const cardColor = Color(0xFFDCC6B3);
    const titleColor = Color(0xFF4B2E1E);
    const subtitleColor = Color(0xFF7B5E4A);
    return Column(
      children: products.map((product) {
        return Card(
          color: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    product["Image"]!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product["Title"]!,
                        style: const TextStyle(
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${product["subtitle"]!}",
                        style: const TextStyle(
                          color: subtitleColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        product["description"]!,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 167, 145, 131),
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: coffeeBrown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              title: product["Title"]!,
                              subtitle: product["subtitle"]!,
                              description: product["description"]!,
                              image: product["Image"]!,
                            ),
                          ),
                        );},
                        child: const Text(
                          "See Details",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
