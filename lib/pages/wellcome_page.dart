// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_trip_app_cubit_api/misc/colors.dart';
import 'package:flutter_trip_app_cubit_api/widgets/app_large_text.dart';
import 'package:flutter_trip_app_cubit_api/widgets/app_text.dart';
import 'package:flutter_trip_app_cubit_api/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['welcome-one.png', 'welcome-two.png', 'welcome-three.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/' + images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 150, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(
                            text: 'Mountain', color: Colors.black, size: 30),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: AppText(
                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dictumst quisque sagittis purus sit.',
                            color: AppColors.textColor2,
                          ),
                        ),
                        SizedBox(height: 40),
                        ResponsiveButton(
                          width: 120,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        3,
                        (indexSlider) => Container(
                          margin: EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexSlider ? 25 : 8,
                          decoration: BoxDecoration(
                            color: index == indexSlider
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
