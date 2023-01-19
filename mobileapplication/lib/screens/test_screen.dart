import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/image_test/image_test_controller.dart';

class testScreen extends StatelessWidget {
  testScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    imagetestcontroller _imagecontroller = Get.find();
    return Scaffold(
        body: Obx((() => ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                    child: SizedBox(
                  height: 200,
                  width: 200,
                  child: FadeInImage(
                    image: NetworkImage(_imagecontroller.allImages[index]),
                    placeholder:
                        AssetImage("mobileapplication/assets/alex.jpg"),
                  ),
                ));
              },
              itemCount: _imagecontroller.allImages.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20);
              },
            ))));
  }
}
