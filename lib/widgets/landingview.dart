// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingObj {
  final String img, txt, miniTxt;
  LandingObj({
    required this.img,
    required this.txt,
    required this.miniTxt,
  });
}

class LandingView extends StatelessWidget {
  //pages
  final List<LandingObj> pages = [
    LandingObj(
      img: './assets/images/land.jpg',
      txt: 'Get Fit,\nGet Strong,\nGet Healthy!',
      miniTxt: 'Welcome to our fitness GYM App.',
    ),
    LandingObj(
      img: './assets/images/land2.jpg',
      txt: 'Volume Up\nYour Body Goals.',
      miniTxt: 'Enhance your working out\nplans for better progessive results.',
    ),
    LandingObj(
      img: './assets/images/land6.jpg',
      txt: 'Working Out\nIs A Life Style.',
      miniTxt: 'Enjoy every minute working out with our coaches.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: pages.map((page) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //image
            SizedBox(
              width: double.infinity,
              height: 500,
              child: Image.asset(
                page.img,
                fit: BoxFit.cover,
              ),
            ),

            //imageShadow
            Container(
              color: Colors.black54,
              width: double.infinity,
              height: double.infinity,
            ),

            //largeText
            Positioned(
              left: 20,
              bottom: 200,
              child: Text(
                page.txt,
                style: const TextStyle(
                  fontSize: 42,
                  fontFamily: 'iosReg',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //miniText
            Positioned(
              left: 24,
              bottom: 150,
              child: Text(
                page.miniTxt,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'iosReg',
                  color: Colors.white54,
                ),
              ),
            ),
          ],
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        height: double.infinity,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 3),
      ),
    );
  }
}
