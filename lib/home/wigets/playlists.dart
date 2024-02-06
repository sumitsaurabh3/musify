import 'package:flutter/material.dart';

import '../../data.dart';

class Playlists extends StatelessWidget {
  const Playlists({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 16/5.5,
    ),
    children: Data().playlist.map((val){
      return  InkWell(
        child: Card(
          color: Colors.black12,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 54,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        val["image"].toString(),
                      ),
                    )
                  ),
                ),
                SizedBox(width: 10,),
                Flexible(child: Text(val["name"].toString(),style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),))
              ],
            ),
          ),
        ),
      );
    }).toList(),);
  }
}


