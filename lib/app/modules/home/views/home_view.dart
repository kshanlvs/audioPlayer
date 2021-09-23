import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  await controller.toggleRecording();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.isRecording.value
                        ? Colors.redAccent
                        : Colors.blueAccent,
                  ),
                  height: 200,
                  width: Get.width,
                  child: controller.isRecording.value
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.stop,
                                size: 50,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Stop Recording",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mic,
                                color: Colors.white,
                                size: 40,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Start Recording",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              controller.isRecording.value
                  ? SizedBox.shrink()
                  : InkWell(
                      onTap: () {
                        controller.playAudio();
                      },
                      child: Container(
                        color: Colors.lime,
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text(
                            "PLAY",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
            ],
          );
          //audio player by kishan kumar shamra
        },
      ),
    );
  }
}
