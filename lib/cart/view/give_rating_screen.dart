import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class GiveRatingScreen extends StatefulWidget {
  const GiveRatingScreen({super.key});

  @override
  State<GiveRatingScreen> createState() => _GiveRatingScreenState();
}

class _GiveRatingScreenState extends State<GiveRatingScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(0, 80, 157, 1),
        middle: Text('Add Review',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  customContainer(bRadius: width*0.05,vPadding: height*0.015,hPadding: width*0.08,containerColor: Color.fromRGBO(0, 80, 157, 1),
                  child: Text('Post',style: TextStyle(fontSize: 16,color: Colors.white),)
                  )
                ],
              ),
              Text('Score:',style: TextStyle(fontSize: 16,color: Colors.grey),),
            _userGivenStars(number: 5, height: height*0.05, size: width*0.08),
            SizedBox(height: height*0.01,),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.02),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(

                  hintText: 'Review:',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(width*0.03)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(width*0.03)
                                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.015),
              child: customContainer(bRadius: width*0.04,vPadding: height*0.02,borderColor: Colors.grey,
              width: width,
              child: Icon(Icons.add,size: width*0.1,)
              ),
            )
          ],
        ),
      )
    );
  }
}
Widget _userGivenStars({required int number,required double height,required double size}){
  return Row(
    children: [
      SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: number,
          itemBuilder: (BuildContext context, int index) {
            return Icon(Icons.star_border,size: size,color: Colors.grey,);
          },),
      )
    ],
  );
}
