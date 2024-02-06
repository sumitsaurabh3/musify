import 'package:flutter/material.dart';
class Tiles extends StatelessWidget {
  const Tiles({super.key, required this.data});
   final List<String>data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap:true ,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 16/9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10

        ),
        children: data.map((imageURL) {
            return Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(imageURL,fit:BoxFit.cover)),
            );
          }).toList(),

      ),
    );
  }
}
