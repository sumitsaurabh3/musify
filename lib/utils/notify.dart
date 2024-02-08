import 'dart:ffi';

import 'package:get/get.dart';
class Notify{
  final isIconPlay=false.obs;
  final isHeartPressed=false.obs;
  void setIconPlay(bool val){
    isIconPlay.value=val;
  }
  void setHeartPressed(bool value){
    isHeartPressed.value=value;
  }
}
