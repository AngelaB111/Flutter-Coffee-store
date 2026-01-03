import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBrown = Color(0xFF4B2E1E);
    const Color bodyText = Color(0xFF7B5E4A);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About Us",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryBrown,
            ),
          ),
          const SizedBox(height: 15),

      
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/beans.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "The Heart of\nOur Coffee",
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          color: primaryBrown,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Coffee O’Clock began as a small dream. Our mission: deliver freshly brewed joy using responsibly sourced beans, roasted daily with care.",
                        style: TextStyle(
                          fontSize: 12,
                          color: bodyText,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: primaryBrown.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "EST. 2025",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: primaryBrown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}