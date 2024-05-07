import 'package:flutter/material.dart';
class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
   final Function(String) onTextChanged;

  const SearchWidget({super.key, required this.controller, required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
         width: double.infinity,
        height: 60,
          margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(15)),
          child:  Row(
            children: [
              const SizedBox(width: 10,),
              const Icon(Icons.search_sharp,size: 30,color: Color.fromRGBO(83, 83, 83, 1),),
              const SizedBox(width: 10,),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onTextChanged,
                  decoration: const InputDecoration( hintText:'Search Songs..',border: InputBorder.none),),
                ),
               ],
          ),
      ),
    );
  }
}
