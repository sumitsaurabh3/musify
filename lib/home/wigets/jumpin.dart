import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/getwidget.dart';
import '../../audio.dart';
import '../../data.dart';

class JumpIn extends StatelessWidget {
  const JumpIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: const Text('Jump back in',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30,color: Colors.white,),),
        ),
        Container(
          height: 240,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Data().anotherRandomList.length,
              itemBuilder: (context,index){
                Map<String, dynamic> item = Data().anotherRandomList[index];
                int id = item['id'] != null ? int.tryParse(item['id'].toString()) ?? 0 : 0;
                return Container(
                  width: 150,
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: Column(
                    crossAxisAlignment: Data().anotherRandomList[index]['alignment']as CrossAxisAlignment,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return AudioPlayerPro(
                                id: id,
                                audioURL: Data().anotherRandomList[index]['audio'].toString(),
                                image: Data().anotherRandomList[index]['image'].toString(),
                                name: Data().anotherRandomList[index]['name'].toString());
                          }),);
                        },
                        child: Container(
                          child: GFAvatar(
                            shape: Data().anotherRandomList[index]['shape'] as GFAvatarShape,
                            backgroundImage: AssetImage(
                              Data().anotherRandomList[index]['image'].toString(),
                            ),
                            radius: 70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Align(
                        alignment:Alignment.center,
                        child: Text(Data().anotherRandomList[index]['name'].toString(),textAlign: TextAlign.center,style: const TextStyle(
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
