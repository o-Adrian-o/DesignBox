import 'dart:math';

import 'package:design_box/box.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random(1234);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Box(
          width: 800,
          margin: const EdgeInsets.all(100),
          color: Colors.white24,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Box(
                  padding: const EdgeInsets.all(4),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 20,
                    children: List.generate(160, (index) {
                      final width = (random.nextDouble() * 4).floorToDouble();
                      final isGradient = random.nextInt(4) >= 3;
                      final color = randomColor(random);
                      final radius = boxRadius(random.nextDouble() * 30);
                      final shadow = boxShadow(random.nextDouble() * 5, alpha: 50);
                      final border = width - 1 > 0 ? boxBorder(Colors.white, width: width - 1) : null;
                      final gradientA = randomColor(random);
                      final gradientB = randomColor(random);
                      final gradient = isGradient
                          ? boxGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              beginColor: gradientA,
                              endColor: gradientB)
                          : null;

                      return Center(
                        child: Box(
                          margin: const EdgeInsets.all(8),
                          color: color,
                          radius: radius,
                          gradient: gradient,
                          shadow: shadow,
                          border: border,
                        ),
                      );
                    }),
                  )),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  width: double.infinity,
                  color: const Color.fromRGBO(50, 50, 50, 0.9),
                  child: title("Design Box")),
            ],
          ),
        ),
      ),
    );
  }
}

final colors = [
  Colors.red,
  Colors.deepPurple,
  Colors.deepOrange,
  Colors.blue,
  Colors.green,
  Colors.lightBlue,
  Colors.cyan,
  Colors.brown,
  Colors.amber,
  Colors.lightGreen,
  Colors.lime,
  Colors.orange,
  Colors.pink,
  Colors.white12,
  Colors.purple,
];

Color randomColor(Random random) {
  return colors[random.nextInt(colors.length)];
}

Widget title(String title) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(1),
          offset: const Offset(0, 0),
          blurRadius: 10,
        ),
        Shadow(
          color: Colors.black.withOpacity(1),
          offset: const Offset(0, 0),
          blurRadius: 20,
        ),
      ],
    ),
  );
}
