// import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class Commercial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: IconButton(
          color: Color(0xFF186AA5),
          iconSize: 50,
          icon: Icon(Icons.wifi),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // child: SearchBar(),
    ),
    ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}