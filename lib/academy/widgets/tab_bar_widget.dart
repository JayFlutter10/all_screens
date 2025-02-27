import 'package:flutter/material.dart';

import '../../constants/widgets/custom_container.dart';

class TapBarWithText extends StatefulWidget {
  final double height;
  final double width;
  final List<dynamic> data;
  final List<dynamic> colors;
  final List<dynamic> iconColors;
  TextStyle? textStyle;
   TapBarWithText(
      {
        super.key,this.textStyle,
        required this.height, required this.data, required this.width, required this.colors, required this.iconColors,
      }
      );

  @override
  State<TapBarWithText> createState() => _TapBarWithTextState();
}

class _TapBarWithTextState extends State<TapBarWithText> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height*0.1,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.data.length,
          itemBuilder: (context,index){
            return Row(
              children: [
                _circleAvatarIcon(
                    color: selectedIndex==index?widget.colors[0]:widget.colors[1],
                    height: widget.height, icon: Icon(widget.data[index]['icon'],color:selectedIndex==index?widget.iconColors[0]:widget.iconColors[1],),title:  widget.data[index]['title'],
                    onTap: (){
                  setState(() {
                    selectedIndex=index;
                  });
                },selectedIndex:  selectedIndex),
                index==widget.data.length-1?Container():_dash(width: widget.width*0.178),
              ],
            );
          }),
    );
  }
  Widget _dash({required double width}){
    return customContainer(bRadius: 10,
        height: 2,
        width: width,
        containerColor: Color.fromRGBO(0, 80, 157, 1)
    );
  }
Widget _circleAvatarIcon({required Color color,required double height,required Icon icon,required String title,VoidCallback? onTap,required int selectedIndex}){
  return Column(
    children: [
      customContainer(
        containerColor:color ,
        onTap: onTap,
        margin: height*0.001,
        borderColor: Color.fromRGBO(0, 80,157, 1),
        hPadding: height*0.02,
        vPadding: height*0.02,
        bRadius:height*0.044 ,
        child: icon,
      ),
      Text(title,style: widget.textStyle??TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
    ],
  );
}

}
