import 'package:flutter/material.dart';
class CurrentPlan extends StatelessWidget {
  const CurrentPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(51, 51, 51, 51),
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
        child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Spotify Free',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          Text('CURRENT PLAN',style: TextStyle(color: Color.fromRGBO(171, 171, 171, 50),fontWeight: FontWeight.bold,fontSize: 10),)
        ],
      ),),
    );
  }
}
