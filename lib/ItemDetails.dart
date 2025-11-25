import 'package:flutter/material.dart';
class DetailPage extends StatefulWidget {
  final String title;
  final String subtitle; // original price as string
  final String description;
  final String image;
  const DetailPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,});

  @override
  State<DetailPage> createState() => _DetailPageState();
}
class _DetailPageState extends State<DetailPage> {
  late double price;
  int quantity =1 ;
  double currentBasePrice = 0.0;
  String selectedSize = "Small";
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
      if (size == "Small") {
        selectedSize="Small";
        currentBasePrice = original;
      } else if (size == "Medium") {
        selectedSize="Medium";
        currentBasePrice = original + 0.75;
      } else if (size == "Large") {
        selectedSize="Large";
        currentBasePrice = original + 1.25;
      }
      price = currentBasePrice * quantity;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 247, 242, 100),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFF4B2E1E)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 5),
            Image.asset('assets/cup1.png', width: 30, height: 30),
            SizedBox(width: 8),
            Text(
              "Coffee O'Clock",
              style: TextStyle(color: Color(0xFF4B2E1E)),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(250, 247, 242, 100),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Card(
            color: Colors.white,
            elevation: 9,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Image.asset(widget.image, width: 300, height: 300),
                SizedBox(height: 20),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF4B2E1E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 17, color: Color(0xFF9E7D67)),
                ),
                SizedBox(height: 20),
                Text(
                  "Price: \$${price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 19, color: Color(0xFF65381D)),
                ),
                SizedBox(height: 10),Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline, color: Color(0xFF4B2E1E)),
                        onPressed: () {
                          if (quantity > 1) {
                              quantity--;
                              updatePrice(quantity);
                          }
                        },
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline, color: Color(0xFF4B2E1E)),
                        onPressed: () {
                            quantity++;
                            updatePrice(quantity);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => selectSize("Small"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedSize == "Small"
                              ? Color(0xFF774B31)
                              : Color(0xFF4B2E1E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Small", style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => selectSize("Medium"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedSize == "Medium"
                              ? Color(0xFF774B31)
                              : Color(0xFF4B2E1E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Medium", style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => selectSize("Large"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedSize == "Large"
                              ? Color(0xFF774B31)
                              : Color(0xFF4B2E1E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Large", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
           ],

            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF4B2E1E),
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
