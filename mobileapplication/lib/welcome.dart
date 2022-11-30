import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileapplication/widget/app_large_text_widget.dart';
import 'package:mobileapplication/widget/app_text_widget.dart';
import 'package:mobileapplication/widget/responsive_button_widget.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List images = [
    "Egypt.jpg",
    "see.jpg",
  ];
  List Text = ['Explore Egypt With Us', 'Login see more!'];
  List Text1 = ['Sights', 'Events'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/" + images[index]),
                fit: BoxFit.cover,
              )),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: Text[index]),
                        AppText(
                          text: Text1[index],
                          size: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "We EgyMania are ready to help you on vacation around Egypt",
                            color: Colors.white70,
                            size: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ResponsiveButton(
                          width: 120,
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(2, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? Color(0xFF878593)
                                : Color(0xFF878593).withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
