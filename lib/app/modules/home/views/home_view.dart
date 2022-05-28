import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Confetti Animation'),
            centerTitle: true,
          ),
          body: Center(
            child: ElevatedButton(
              child:
                  Obx(() => Text(controller.isPlaying.value ? "Stop" : "Play")),
              onPressed: () {
                controller.startConfettiAnimation();
              },
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller.confettiController,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive, //all
          //  blastDirection: 0, //right
          //blastDirection: pi,//left default
          //   blastDirection: pi/2,// down
          // blastDirection: -pi / 2, // up,
           emissionFrequency: 0.8, //default 0.2
          numberOfParticles: 20, //default 10
            gravity: 0.8, //default 0.1

            colors: [Colors.red, Colors.purple, Colors.green],
          createParticlePath: (size) {
            var path = Path();
            path.addOval(Rect.fromCircle(center: Offset.zero, radius: 20));
            return path;
          },
        )
      ],
    );
  }
}
