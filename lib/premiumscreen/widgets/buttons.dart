import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key, required this.text});
  final String text;

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  late Razorpay _razorpay;
 @override
  void initState() {
   _razorpay=Razorpay();
    super.initState();
  }
  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
  void openCheckout() async {
    try{
      _razorpay.open({
       'name': 'Spotify Premium',
       'key' :'rzp_live_ILgsfZCZoFIKMb',
        'amount' :'10000',
        'description':'general',
        'retry' :{'enabled':true,'max_count':1},
        'send_sms_hash':true,
        'prefill':{'contact':'9900000000','email':'sumitsaurabh799@gmail.com'},
        'external':{
         'wallets':['paytm']
        }
      });
    }
    catch(e)
    {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 70.0,right: 70),
        child: TextButton(
          onPressed: () {
            openCheckout();
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            widget.text,
            style:
                TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 2,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
