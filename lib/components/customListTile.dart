import 'package:flutter/material.dart';
import 'package:travelapp/constant.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/profile.jpeg'),
          ),
          title: Text('John Doe',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          subtitle: Text('Welcome',
              style: TextStyle(fontSize: 12, color: Colors.black)),
        ),
      ),
    );
  }
}
