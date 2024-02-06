import 'package:flutter/material.dart';
import 'package:spotify_clone/searchscreen/widgets/searchWidget.dart';
import 'package:spotify_clone/searchscreen/widgets/topgenres.dart';
import '../bottomNavBar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Search",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            SearchWidget(),
             TopGenres(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
