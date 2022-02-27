// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_trip_app_cubit_api/misc/colors.dart';
import 'package:flutter_trip_app_cubit_api/widgets/app_large_text.dart';
import 'package:flutter_trip_app_cubit_api/widgets/app_text.dart';
import 'package:flutter_trip_app_cubit_api/widgets/responsive_button.dart';

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
      body: CustomScrollView(
          controller: ScrollController(
            initialScrollOffset: 200,
            keepScrollOffset: false,
          ),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              floating: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'img/mountain.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 16.0,
                    ),
                  ],
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 20,
                        left: 0,
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
                            SizedBox(width: 20),
                            ResponsiveButton(
                              isResponsive: true,
                            ),
                          ],
                        ),
                      ),
                      Column(
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
                                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
                            color: AppColors.mainTextColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
