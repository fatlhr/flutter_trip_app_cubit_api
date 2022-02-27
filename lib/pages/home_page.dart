// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trip_app_cubit_api/misc/colors.dart';
import 'package:flutter_trip_app_cubit_api/widgets/app_large_text.dart';
import 'package:flutter_trip_app_cubit_api/widgets/app_text.dart';

import '../cubit/app_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List cardImages = ['mountain.jpeg', 'mountain.jpeg', 'mountain.jpeg'];
  List exploreText = ['Kayaking', 'Snorkling', 'Balloning', 'Hiking'];
  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        TabController(length: cardImages.length, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu, size: 30, color: Colors.black87),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //child: Image.asset('img/'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: AppLargeText(text: 'Discover')),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelColor: Colors.black,
                        labelPadding: EdgeInsets.symmetric(horizontal: 10),
                        unselectedLabelColor: Colors.black.withOpacity(0.3),
                        controller: _tabController,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.2),
                          shape: BoxShape.rectangle,
                        ),
                        tabs: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Tab(
                              text: "Places",
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Tab(
                              text: "Inspirations",
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Tab(
                              text: "Emotions",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: info.length,
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                            onTap: () {
                              BlocProvider.of<AppCubit>(context)
                                  .detailPage(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10, right: 15),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'http://mark.bslmeiyu.com/uploads/' +
                                          info[index].img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text('2'),
                        Text('3'),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: 'Explore More',
                          size: 22,
                        ),
                        InkWell(
                            onTap: () {},
                            child: AppText(
                              text: 'See All',
                              size: 14,
                              color: AppColors.textColor1,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: exploreText.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height < 700
                                  ? 60
                                  : 80,
                              width: MediaQuery.of(context).size.height < 700
                                  ? 60
                                  : 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'img/${exploreText[index].toString().toLowerCase()}.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 8),
                              alignment: Alignment.center,
                              child: AppText(
                                  text: exploreText[index],
                                  size: MediaQuery.of(context).size.height < 600
                                      ? 12
                                      : 14,
                                  color: AppColors.textColor2),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
