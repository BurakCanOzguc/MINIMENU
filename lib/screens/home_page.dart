import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/menu1.png",
                  height: deviceHeight / 3,
                  width: deviceWidth,
                  fit: BoxFit.cover,
                ),
                GestureDetector(
                  onTap: () => print("Yemekler"),
                  child: Container(
                    color: Colors.transparent,
                    height: deviceHeight / 6,
                    width: deviceWidth,
                  ),
                ),
                Positioned(
                  top: deviceHeight / 6,
                  child: GestureDetector(
                    onTap: () => print("İçecekler"),
                    child: Container(
                      color: Colors.transparent,
                      height: deviceHeight / 6,
                      width: deviceWidth / 2,
                    ),
                  ),
                ),
                Positioned(
                  top: deviceHeight / 6,
                  left: deviceWidth / 2,
                  child: GestureDetector(
                    onTap: () => print("Meyveler"),
                    child: Container(
                      color: Colors.transparent,
                      height: deviceHeight / 6,
                      width: deviceWidth / 2,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text("Sıfırla")),
            Center(),
          ],
        ),
      ),
    );
  }
}
