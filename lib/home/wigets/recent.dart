import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spotify_clone/audio.dart';
import '../../data.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: const Text('Recently Played',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30,color: Colors.white,),),
          ),
          Container(
            height: 210,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Data().recentlyPlayed.length,
                itemBuilder: (context,index){
              return Container(
                width: 150,
                padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                child: Column(
                  crossAxisAlignment: Data().recentlyPlayed[index]['alignment']as CrossAxisAlignment,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return AudioPlayerPro(audioURL: Data().recentlyPlayed[index]['audio'].toString(),
                              image: Data().recentlyPlayed[index]['image'].toString(), name: Data().recentlyPlayed[index]['name'].toString());
                        }),);
              },
                     child: Container(
                       child: GFAvatar(
                              shape: Data().recentlyPlayed[index]['shape'] as GFAvatarShape,
                         backgroundImage: AssetImage(
                           Data().recentlyPlayed[index]['image'].toString(),
                         ),
                         radius: 70,
                       ),
                     ),
                    ),
                    const SizedBox(height: 10,),
                    Align(
                      alignment:Alignment.center,
                      child: Text(Data().recentlyPlayed[index]['name'].toString(),textAlign: TextAlign.center,style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,),
                    )
                  ],
                ),
              );
            }),
          )
        ],
    );
  }
}
