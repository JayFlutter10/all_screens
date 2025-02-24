import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/widgets/custom_container.dart';

class ProgressView extends StatefulWidget {
 const  ProgressView({super.key});

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {

final bool isFilled=true;
int selection=0;
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Video Watching
            Container(
              margin: EdgeInsets.all(2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _customTimeline('ID',(){
                    setState(() {
                      selection=0;
                    });
                  },selection==0?true:false,

                  ),
                  _dash(width),
                  _customTimeline('Certificate',(){
                    setState(() {
                      selection=1;
                    });
                  },selection==1?true:false),
                  _dash(width),
                  _customTimeline('Appointment\n Letter',(){
                    setState(() {
                      selection=2;
                    });
                  },selection==2?true:false,
                  ),
                  _dash(width),
                  _customTimeline('Agreement',(){
                    setState(() {
                      selection=3;
                    });
                  },selection==3?true:false),
                  _dash(width),
                  _customTimeline('Bill',(){
                    setState(() {
                      selection=4;
                    });
                  },selection==4?true:false),
               ],
              ),
            ),
           selection==0? Column(
              children: [
                customContainer(
                  margin: 10,
                  vPadding: 15,
                  hPadding: 15 ,
                  bRadius: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ID',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      customContainer(
                        containerColor: Colors.green,
                        bRadius: 15,
                        vPadding: 5,
                        hPadding: 15 ,
                        child: Text('Download',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                      )
                    ],
                  ),
                ),

                customContainer(
                    margin: 10,
                    bRadius: 10,
                    vPadding: 5,
                    hPadding: 10,
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Start watching...',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        customContainer(bRadius: 12,
                            containerColor: Colors.grey,
                            height: height*0.25,width: double.infinity),
                        Text('Business Analysis & Process Management',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                      ],
                    )
                ),
                customContainer(
                  bRadius: 10,
                  vPadding: 10,
                  hPadding: 10,
                  width: width*0.6 ,containerColor: Color.fromRGBO(0, 63, 136, 1),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(CupertinoIcons.lock,color: Colors.white,size: 18,),
                      Text('Download Certificate',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                //Appointment


              ],
            ):Container(),
            selection==2? Column(
              children: [
                customContainer(
                    margin: 10,
                    bRadius: 10,
                    vPadding: 15,
                    hPadding: 10,
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Appointment Letter  ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                Icon(CupertinoIcons.lock,size: 18,),
                              ],
                            ),
                            customContainer(
                              containerColor: Colors.green,
                              bRadius: 15,
                              vPadding: 5,
                              hPadding: 15 ,
                              child: Text('Download',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                            )
                          ],
                        ),

                      ],
                    )
                ),
                Container(
                  height: height*0.27,
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context,index){
                        int ind=index+1;
                        return customContainer(
                          hPadding: 5,
                          vPadding: 8,
                          bRadius: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Tutorial $ind'),
                              Row(
                                children: [
                                  Text('5 min'),
                                  Icon(Icons.check_circle_outline,color: Colors.green,),
                                ],
                              ),
                              customContainer(bRadius: 8,
                                  onTap: (){},
                                  hPadding: 8,
                                  containerColor:Colors.green,child: Text('Complete',style: TextStyle(color: Colors.white),))
                            ],
                          ),
                        );
                      }),
                ),

                Container(
                    padding: EdgeInsets.all(15),
                    child: Text('Complete all the videos and live webinars to unlock your documents',textAlign: TextAlign.center,style: TextStyle(decoration: TextDecoration.underline,fontSize: 16),)),
                    customContainer(
                    margin: 10,
                    bRadius: 10,
                    vPadding: 5,
                    hPadding: 10,
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Continue where you left..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        customContainer(bRadius: 12,
                            containerColor: Colors.grey,
                            height: height*0.25,width: double.infinity),
                        Text('Business Analysis & Process Management',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                      ],
                    )
                ),//rgba(0, 80, 157, 1)
                customContainer(
                  bRadius: 10,
                  vPadding: 10,
                  hPadding: 10,
                  width: width*0.6 ,
                  containerColor: Color.fromRGBO(0, 80, 157, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.lock,color: Colors.white,),
                      Text('Download Certificate',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
              ],
            ):Container(),
          ],
        ),
      ),
    );
  }
}



Widget _customTimeline(String text,  VoidCallback onTap,bool isSelected){
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        !isSelected?Icon(Icons.circle_outlined,size: 30,color: Color.fromRGBO(0, 63, 136, 1),):Icon((Icons.circle),size: 30,color: Color.fromRGBO(0, 63, 136, 1),),
        Text(text,style: TextStyle(
          fontSize: 12,
        ),),
      ],
    ),
  );
}
Widget _dash(double width){
  return customContainer(bRadius: 1,height: 4,width:width*0.08,containerColor:  Color.fromRGBO(0, 63, 136, 1));

}