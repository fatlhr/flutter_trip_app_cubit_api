// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_trip_app_cubit_api/misc/colors.dart';
import 'package:flutter_trip_app_cubit_api/widgets/app_large_text.dart';
import 'package:flutter_trip_app_cubit_api/widgets/app_text.dart';

import '../widgets/app_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 3;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        //height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height < 600 ? 240 : 350,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/mountain.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              width: double.maxFinite,
              top: 30,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      color: Colors.white),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height < 600 ? 200 : 315,
              left: 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                              text: "Yosemite",
                              color: Colors.black.withOpacity(0.8)),
                          AppLargeText(
                              text: "\$ 250", color: AppColors.mainColor),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: AppText(
                                text: "USA, California",
                                color: AppColors.textColor1),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: gottenStar >= index + 1
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(gottenStar.toString() + ".0",
                              style: TextStyle(color: AppColors.textColor2))
                        ],
                      ),
                      SizedBox(height: 25),
                      AppLargeText(
                        text: 'People',
                        size: 22,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      SizedBox(height: 5),
                      AppText(
                          text: 'Number of people in your group',
                          color: AppColors.mainTextColor),
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          children: List.generate(
                            5,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: AppButton(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AppLargeText(
                        text: 'Description',
                        color: Colors.black.withOpacity(0.8),
                      ),
                      SizedBox(height: 5),
                      AppText(
                        text:
                            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 0,
              child: Row(
                children: [
                  AppButton(
                    size: 60,
                    color: AppColors.textColor2,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor2,
                    isIcon: true,
                    icon: Icons.favorite_outline,
                  ),
                  AppText(text: MediaQuery.of(context).size.height.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
