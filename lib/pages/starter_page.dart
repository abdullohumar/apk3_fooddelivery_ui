import 'package:apk3/animations/fade_animations.dart';
import 'package:apk3/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeIn,
    ).drive(Tween<double>(begin: 1.0, end: 25.0));
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void onTap() {
    setState(() {
      _textVisible = !_textVisible;
    });

    _animationController?.forward().then((value) => Navigator.push(
        context,
        PageTransition(
            child: const HomePage(), type: PageTransitionType.fade)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/view.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ]),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FadeAnimation(
                      delay: .5,
                      child: Text("Traditional Local Food Ordering",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold))),
                  const SizedBox(height: 5),
                  const FadeAnimation(
                      delay: 1,
                      child: Text("See restaurants nearby by \nadding location",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ))),
                  const SizedBox(height: 40),
                  FadeAnimation(
                      delay: 1.2,
                      child: ScaleTransition(
                          scale: _animation!,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [Colors.yellow, Colors.orange])),
                              child: AnimatedOpacity(
                                opacity: _textVisible ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 500),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  onPressed: () {
                                    onTap();
                                  },
                                  child: const Text(
                                    'Start',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              )))),
                  const SizedBox(height: 20),
                  FadeAnimation(
                    delay: 1.4,
                    child: AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 50),
                      child: const Align(
                        child: Text(
                          "Now We deliver to your home 24/7",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
