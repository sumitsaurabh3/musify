import 'package:flutter/material.dart';
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CircleAvatar(
                   radius: 16,
                   backgroundColor: Colors.deepOrange,
                   child: Text("S",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                 ),
                 SizedBox(width: 10,),
                 Text("Your Library",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                 Row(
                   children: [
                     Icon(Icons.search_sharp,color: Colors.white,size: 30,),
                     SizedBox(width: 15,),
                     Icon(Icons.add,color: Colors.white,size: 30,),
                   ],
                 )

               ],
        ),
      ),
    );
  }
}
