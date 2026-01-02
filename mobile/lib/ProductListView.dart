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

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.70,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return Card(
          color: cardColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
            
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _navigateToDetail(context, product),
            child: GridTile(
              footer: Padding(
                padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
                child: Row(
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
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1.25,
                      child: Image.asset(
                        "assets/${product["Image"]?.replaceFirst('/', '')}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product["Title"] ?? "Unknown Coffee",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          product["description"] ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
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
          image: "assets/${product["Image"]?.replaceFirst('/', '')}",
        ),
      ),
    );
  }
}
