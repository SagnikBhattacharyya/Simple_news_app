import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/empty.jpg")
          )
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )
            ),
            padding: EdgeInsets.all(10.0),
            child: Text("Title",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            ),
          ),
          );
        });
  }
}
