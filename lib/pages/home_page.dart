import 'package:apk3/animations/fade_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: const Icon(null),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                      delay: 1,
                      child: Text(
                        'Food Delivery',
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FadeAnimation(delay: 1, child: makeCategory(isActive: true,title: 'Pizza',),
                        ),
                        FadeAnimation(delay: 1.2, child: makeCategory(isActive: false,title: 'Burger',),
                        ),
                        FadeAnimation(delay: 1.4, child: makeCategory(isActive: false,title: 'Sandwich',),
                        ),
                        FadeAnimation(delay: 1.6, child: makeCategory(isActive: false,title: 'Salad',),
                        ),
                        FadeAnimation(delay: 1.8, child: makeCategory(isActive: false,title: 'Dessert',),
                        ),]),
                  ),
                ],
              ),
            ),
            FadeAnimation(
              delay: 1, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), //EdgeInsets.all(20.0),
                child: Text('Free Delivery', style: TextStyle(color: Colors.grey.shade700, fontSize: 25, fontWeight: FontWeight.bold),),
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(delay: 1.2, child: makeItem(image: 'assets/images/WP.jpg',),),
                    FadeAnimation(delay: 1.3, child: makeItem(image: 'assets/images/view.jpg',),)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  Widget makeCategory({required bool isActive, required String title}) {
    return AspectRatio(
        aspectRatio: isActive ? 3 : 2.5 / 1,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: isActive ? Colors.yellow.shade700 : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Align(
            child: Text(
              title,
              style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey.shade800,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                  fontSize: 18),
            )),
        ));
  }

  Widget makeItem({required String image}) {
    return AspectRatio(
        aspectRatio: 1 / 1.4,
        child: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: const [0.2, 0.9],
                      colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.3),
                  ])),
                child:  const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.favorite,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\$ 10.00", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text("Veggie Pizza", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                        ],
                      )
                    ],
                  ),
                ),
            ),
          ),
        ),
    );
  }
}
