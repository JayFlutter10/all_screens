import 'package:flutter/material.dart';

Widget rowTextField({required String name,required double width,required double height, TextEditingController? controller,String? hintText,bool? isManda}){
  bool? isMandatory=isManda;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          isMandatory==true?Text('*',style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w600),):Text('')
        ],
      ),SizedBox(width: width,),
      Expanded(
        child: SizedBox(
          height:height,
          child: TextField(
            controller: controller,
            cursorColor: Colors.blue,
            cursorWidth: 0.1,
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                hintText: hintText??'',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200)
                )
            ),
          ),
        ),
      ),
    ],
  );
}