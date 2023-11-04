import 'package:flutter/material.dart';
import 'package:travelapp/constant.dart';

import '../../components/card.dart';
import '../../components/customListTile.dart';
import '../../components/search_bar.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            CustomListTile(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: size.height * 0.8,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 100.0,
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          width: size.width,
                          child: Text("Hii"),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
