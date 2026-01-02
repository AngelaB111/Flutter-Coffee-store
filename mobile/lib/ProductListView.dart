import 'package:flutter/material.dart';
import 'package:mobile/ItemDetails.dart';

class Productlistview extends StatelessWidget {
  final List<Map<String, String>> products;

  const Productlistview({super.key, required this.products});

  @override
  Widget build(BuildContext context) {

    const coffeeBrown = Color(0xFF4B2E1E); 
    const cardColor = Colors.white; 
    const titleColor = Color(0xFF4B2E1E);
    const subtitleColor = Color(0xFF7B5E4A);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return Card(
          color: cardColor,
          margin: const EdgeInsets.symmetric(vertical: 10),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
          ),
          child: InkWell( 
            borderRadius: BorderRadius.circular(20),
            onTap: () => _navigateToDetail(context, product),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        product["Image"] ?? 'assets/placeholder.png', 
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product["Title"] ?? "Unknown Coffee",
                          style: const TextStyle(
                            color: titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product["description"] ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${product["subtitle"] ?? "0.00"}",
                              style: const TextStyle(
                                color: subtitleColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: coffeeBrown,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToDetail(BuildContext context, Map<String, String> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          title: product["Title"] ?? "Coffee",
          subtitle: product["subtitle"] ?? "0.00",
          description: product["description"] ?? "",
          image: product["Image"] ?? 'assets/placeholder.png',
        ),
      ),
    );
  }
}