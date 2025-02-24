import 'package:flutter/material.dart';

import '../../constants/widgets/custom_container.dart';

class TwoMinGyanView extends StatelessWidget {
  const TwoMinGyanView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(title: Text("2 Min Gyan"),),
     body: Container(
       margin: EdgeInsets.all(15),
       child: Column(spacing: height*0.02,
          children: [
            //Search Bar
            Row(
              spacing: width*0.1,
              children: [
                Text("Top Videos",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                Expanded(
                  child: SizedBox(
                    height: height*0.06,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search by name",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                ),
              ],),
            //Image Containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: customContainer(containerColor: Colors.blue.shade200,bRadius: 10, height: height*0.35, width: height*0.3),),
                SizedBox(width: 9,),
                Expanded(child: customContainer(containerColor: Colors.blue.shade200,bRadius: 10, height: height*0.35, width: height*0.3),),
              ],
            ),
            //Stack
            Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recommended',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                _stackCustom(),
              ],
            ),
          ],),
     )
          );
  }
}


Widget _stackCustom(){
  return Stack(
    fit: StackFit.passthrough,
    children: [
      Center(
        child: Expanded(
          child: customContainer(
            margin: 15,
            containerColor: Colors.grey[200],
            hPadding:10,
            vPadding: 12,
            bRadius: 10,

            child: Row(
              spacing: 15,
              children: [
                customContainer(bRadius: 5,
                    child: SizedBox(
                      height: 130,width: 60,
                    )
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:80.0),
                      child: RichText(
                          text: TextSpan(
                              text: 'Simplify Legal Services',
                              style: TextStyle(color: Colors.blue[200],fontSize: 16),
                              children: [
                                TextSpan(
                                    style: TextStyle(color: Colors.black,fontSize: 16),
                                    text:'\nReferrals and Get Paid with BizBooster!'
                                )
                              ]
                          )),
                    ))
              ],
            ),
          ),
        ),
      ),//customContainer
      customContainer(
        containerColor: Colors.grey[200],
        hPadding:15,
        vPadding: 18,
        bRadius: 10,
        child: Row(
          spacing: 15,
          children: [
            customContainer(bRadius: 5,
                child: SizedBox(
                  height: 60,width: 60,
                )
            ),
            Expanded(child: RichText(text: TextSpan(
                text: 'Branding Made Profitable:',
                style: TextStyle(color: Colors.blue,fontSize: 16),
                children: [
                  TextSpan(
                      style: TextStyle(color: Colors.black,fontSize: 16),
                      text:'How to Share Marketing Leads on BizBooster'
                  )
                ]
            )))
          ],
        ),
      ),
    ],
  );
}