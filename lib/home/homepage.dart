import 'package:flutter/material.dart';
import 'package:spotify_clone/home/wigets/headerAction.dart';
import 'package:spotify_clone/home/wigets/jumpin.dart';
import 'package:spotify_clone/home/wigets/playlists.dart';
import 'package:spotify_clone/home/wigets/recent.dart';
import '../bottomNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(47, 80, 75, 1),
                Color.fromRGBO(60, 80, 75, 1),
                Color.fromRGBO(43, 90, 70, 1),
                Color.fromRGBO(47, 68, 65, 1),
              ],
              stops: [
                0.01,0.05,0.06,0.3],
            ),
      
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 10),
            child: ListView(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                  Text('Good morning',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,fontFamily:''),),
                    SizedBox(width: 70,),
                    HeaderAction(),
                        ]
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 200,
                  child:  Playlists(),
                ),
                 RecentlyPlayed(),
                JumpIn(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(0),
      ),
    );
  }
}
