import 'package:flutter/material.dart';

import '../../components/card.dart';
import '../../components/customListTile.dart';
import '../../components/search_bar.dart';
import '../../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          CustomListTile(),
          SizedBox(
            height: 10,
          ), // Your custom ListTile
          searchBar(),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              //for blue bg
              Container(
                height: size.height * 0.7,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
              ),

              //white container to work with listview
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Container(
                  height: size.height * 0.6,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          30), // Adjust the border radius as needed
                      topRight: Radius.circular(
                          30), // Adjust the border radius as needed
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 80.0,
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                margin:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                width: size.width,
                                child: Text("Hii"),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),

              //card
              Align(
                alignment: Alignment.topCenter,
                child: PlanCardComponent(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
