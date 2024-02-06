import 'package:flutter/material.dart';

class HeaderAction extends StatelessWidget {
  const HeaderAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
       children: [
         Icon(
           Icons.history,
           color: Colors.white,
         ),
         SizedBox(width: 10,),
         Icon(
           Icons.settings,
           color: Colors.white,
         ),

       ],
    );
  }
}
