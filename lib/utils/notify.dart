import 'package:get/get.dart';
class Notify{
  final isIconPlay=false.obs;
  void setIconPlay(bool val){
    isIconPlay.value=val;
  }
}