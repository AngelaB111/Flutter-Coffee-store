import 'package:flutter/cupertino.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: Column(
        children: [
          Padding(
            padding:  const EdgeInsets.all(5),
            child: Text("About Us", style:TextStyle( fontSize: 30 ,
              fontWeight: FontWeight.bold,
              color:  Color(0xFF502929),) ,),

          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: const EdgeInsets.all(30),
                child:   Container(
                    width: 160,
                    height: 210,
                    decoration: const BoxDecoration(
                   image: DecorationImage(
                   image: AssetImage('assets/beans.jpg'),
                    fit:  BoxFit.cover,
                  )
                    ),
                ),),
                  Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 25,),
                      Text(
                        "The Heart of Our Coffee",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:  Color(0xFF502929),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Founded with a passion for perfecting every cup, Coffee O’Clock began as a small dream fueled by big flavors. Our mission is simple: deliver freshly brewed joy using responsibly sourced beans, roasted daily with care. From our cozy beginnings to our expanding menu, we’re committed to quality, community, and the love of great coffee.",
                        style: TextStyle(
                          fontSize: 10,
                            color:Color(0xFF7B5E4A),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
                ),
       ],
      ),
    );
    }
}
