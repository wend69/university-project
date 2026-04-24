import 'package:flutter/material.dart';

AppBar appbar() {
  return AppBar(
    toolbarHeight: 90,
    backgroundColor: Colors.transparent,
    title: Padding(
      padding: const EdgeInsets.only(left: 100.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text(
              "Dashboard",
              style: TextStyle(color: Color.fromRGBO(0, 252, 172, 1)),
            ),
            SizedBox(width: 150),
            Container(
              width: 300,
              height: 35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 81, 62, 62),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 138, 131, 131),
                    fontSize: 13,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 252, 172, 1),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [
      Row(
        children: [
          Icon(Icons.keyboard_arrow_down),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Daniel james potter"),
              Text(
                "daniel.james@gmail.com",
                style: TextStyle(fontSize: 12, color: Colors.white38),
              ),
            ],
          ),
          SizedBox(width: 15),
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxJIkRR5xaxAjrWIeuiGkZBj4cMK7JFkB2CQ&s",
            ),
          ),
          SizedBox(width: 100),
        ],
      ),
    ],
  );
}
