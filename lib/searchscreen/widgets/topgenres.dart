import 'package:flutter/material.dart';
import 'package:spotify_clone/searchscreen/widgets/tiles.dart';

import '../../data.dart';
class TopGenres extends StatelessWidget {
  const TopGenres({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your top genres',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,),),
          SizedBox(height: 10,),
          Tiles(data: Data().genres),
          SizedBox(height: 10,),
          Text('Browse All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
          SizedBox(height: 10,),
          Tiles(data: Data().browseall)
        ],
      ),
    );
  }
}
