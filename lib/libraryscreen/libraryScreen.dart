import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spotify_clone/bottomNavBar.dart';
import 'package:spotify_clone/data.dart';
import 'package:spotify_clone/libraryscreen/library_widget/rounded_card.dart';
import 'library_widget/header.dart';
import 'library_widget/tiles.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListView(
            children:  [
              Header(),
              SizedBox(height: 10,),
              Row(
                children: [
                  RoundedCard(text: 'Playlist',),
                  SizedBox(width: 10,),
                  RoundedCard(text: 'Artists',),
                ],
              ),
              SizedBox(height: 25,),
      
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(Icons.compare_arrows_rounded,color: Colors.white,size: 15,),
                      SizedBox(width: 10,),
                      Text('Recently Played',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w900),)
                    ],),
                    Icon(Icons.add_box_outlined,color: Colors.white,size: 15,)
                  ],
                ),
              ),
               ...Data().library.map((val) {
                 return GFListTile(
                   avatar: GFAvatar(
                     backgroundImage: AssetImage(
                       val['image'].toString(),
                     ),
                     radius: 30,
                     shape:val['shape'] as dynamic ,
                   ),
                   title: Text(val['name'].toString(),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                   subTitle:Text(val['subtitle'].toString(),style: TextStyle(color: Color.fromRGBO(167, 167, 167, 1),fontSize: 14,fontWeight: FontWeight.bold),),
                 );
      
               }).toList(),
              TilesLib(title:'Add Artists',shape:GFAvatarShape.circle,),
              TilesLib(title:'Add Podcasts and Show',shape:GFAvatarShape.square,),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(2),
      ),
    );
  }
}
