import 'package:flutter/material.dart';
import 'package:spotify_clone/premiumscreen/widgets/buttons.dart';
import 'package:spotify_clone/premiumscreen/widgets/cards.dart';
import 'package:spotify_clone/premiumscreen/widgets/currentplan.dart';

import '../bottomNavBar.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 50),
        body: ListView(
        children: const [
           SizedBox(height: 70,),
          Text("Get 12 months of \n Premium for ₹200",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 35,),),
          Cards(),
         Buttons(text:"GET PREMIUM"),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("*Terms and conditions apply. Open only to users who aren\'t"
                " subscribed to a recurring Premium plan and who haven\'t purchased "
                "a 12-month one-time Premium plan at a promotional price. Offer ends 30/03/24.",style: TextStyle(color: Color.fromRGBO(184, 184, 184, 10),fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
          CurrentPlan(),
        ],
      ),
        bottomNavigationBar: BottomNavBar(3),
      
      ),
    );
  }
}
