import 'package:flutter/material.dart';

class MakeItem extends StatelessWidget {
  const MakeItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
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
