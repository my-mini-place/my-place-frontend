import 'package:basics/Presentation/Utils/gaps.dart';

import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  const OptionTile(
      {super.key,
      required this.navigation,
      required this.title,
      required this.description,
      required this.icon});

  final Function navigation;
  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigation();
      },
      child: Container(
        decoration: BoxDecoration(
            //  border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 2), // changes position of shadow
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 35,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH10,
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    gapH10,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
