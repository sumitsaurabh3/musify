import 'package:flutter/material.dart';

import 'buttons.dart';
class PremiumPlan extends StatelessWidget {
  const PremiumPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
      child: Container(
        height: MediaQuery.of(context ).size.height*0.7,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
        decoration:  BoxDecoration(
            gradient: const LinearGradient(
                begin:Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromRGBO(4, 104, 78, 50),
                  Color.fromRGBO(11, 173, 108, 50),
                  Color.fromRGBO(17, 173, 108, 50),
                ]
            ),
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('Premium Individual',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),),

           Column(

             children: [
               Text('₹100',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20,),),
               Text('FOR 9 MONTHS',style: TextStyle(color: Color.fromRGBO(136, 205, 180, 100),fontWeight: FontWeight.w900,fontSize: 13,),textAlign: TextAlign.center,),
             ],
           ) ,],),

            Text('3 Months free with 6 months of \n premium / Add Free music / Download to listen offline',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),textAlign: TextAlign.center,),
            Buttons(text:"VIEW PLANS"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("*Terms and conditions apply. Open only to users who aren\'t"
                  " subscribed to a recurring Premium plan and who haven't purchased "
                  "a 12-month one-time Premium plan at a promotional price. Offer ends 30/03/24.",style: TextStyle(color: Color.fromRGBO(184, 184, 184, 10),fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
