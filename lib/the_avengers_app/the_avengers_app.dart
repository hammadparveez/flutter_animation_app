
import 'package:flutter/material.dart';

class TheAvengersApp extends StatefulWidget {
  const TheAvengersApp({super.key});

  @override
  State<TheAvengersApp> createState() => _TheAvengersAppState();
}

class _TheAvengersAppState extends State<TheAvengersApp> {
  late final PageController _pageController;
  late final PageController _innerPageController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _innerPageController =
        PageController(initialPage: _currentIndex, viewportFraction: 1 / 1.4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('The Avengers'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Stack(
        children: [
          PageView.builder(
              padEnds: false,
              itemCount: 8,
              controller: _pageController,
              itemBuilder: (context, index) {
                return TweenAnimationBuilder<double>(
                  curve: Curves.elasticOut,
                  duration: const Duration(milliseconds: 1800),
                  tween: _currentIndex == index
                      ? Tween(begin: 1, end: 1.4)
                      : Tween(begin: 1, end: 1),
                  builder: (context, value, child) {
                    return Transform.scale(
                      alignment: Alignment.center,
                      scale: value,
                      child: child,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/${index + 1}.jpeg'),
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                          Colors.black45, BlendMode.darken),
                    )),
                  ),
                );
              }),
          PageView.builder(
              itemCount: 8,
              controller: _innerPageController,
              onPageChanged: (index) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn);
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                return Center(
                  child: TweenAnimationBuilder<double>(
                    curve: Curves.elasticOut,
                    duration: const Duration(milliseconds: 1800),
                    tween: _currentIndex == index
                        ? Tween(begin: 1, end: 1.2)
                        : Tween(begin: 1, end: 1),
                    builder: (context, value, child) {
                      return Transform.scale(
                        alignment: Alignment.center,
                        scale: value,
                        child: child,
                      );
                    },
                    child: Container(
                      height: 350,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: const [
                            BoxShadow(blurRadius: 10),
                          ],
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/${index + 1}.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
