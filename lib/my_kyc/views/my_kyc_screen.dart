import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class MyKycScreen extends StatefulWidget {
  const MyKycScreen({super.key});

  @override
  State<MyKycScreen> createState() => _MyKycScreenState();
}

class _MyKycScreenState extends State<MyKycScreen> {
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.02),
          child: Column(
            children: [
              ///User Details
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade200,
                      radius:width*0.1,
                      child: Icon(CupertinoIcons.person_alt_circle,size: width*0.2,color: Colors.blue,),
                    ),
                    SizedBox(width: width*0.02,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mansi1',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          Text('Joined on - 00:00:0000',style: TextStyle(fontSize: 14),),
                          Text('Address - Lorem ipsum dolor sit amet',style: TextStyle(fontSize: 14),),
                        ],
                      ),
                    ),
                  ],
                ),

             ///Contact Information
               customContainer(bRadius: width*0.04,vMargin: height*0.01,hMargin: width*0.02,
                hPadding: width*0.04,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Contact',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    Row(
                      children: [
                        IconButton(icon:Icon(Icons.call,size: width*0.07,color: Color.fromRGBO(0, 80, 157, 1)), onPressed: () {  },),

                        IconButton(icon:Icon(CupertinoIcons.chat_bubble_text,size: width*0.07,color: Color.fromRGBO(0, 80, 157, 1)), onPressed: () {  },),
                      ],
                    )
                  ],
                ),),

              ///Timeline
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                _customTimeline(text: 'User', onTap: () {  }, isSelected: true),
                _dash(width),
                _customTimeline(text: 'Upgrade\nFranchise', onTap: () {  }, isSelected: true),
                _dash(width),
                _customTimeline(text: 'KYC', onTap: () {  }, isSelected: false),
              ],),
              SizedBox(height: height*0.02,),

              ///Tutorials
              customContainer(
                bRadius: width*0.01,
                vPadding: height*0.01,
                hPadding: width*0.04,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tutorials',style: TextStyle(fontSize: 16),),
                        customContainer(bRadius: width*0.04,vPadding: height*0.005,containerColor: Colors.red,
                            hPadding: width*0.02,
                          child: Text('Ongoing',style: TextStyle(fontSize: 14,color: Colors.white),),
                          onTap: (){}
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.02,),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                      return _customListView(width: width, height: height, title: 'Tutorial ${index+1}');

                    }),
                    SizedBox(height: height*0.02,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Live Webinar',style: TextStyle(fontSize: 16),),
                        customContainer(bRadius: width*0.04,vPadding: height*0.005,containerColor: Colors.red,
                            hPadding: width*0.02,
                            child: Text('Ongoing',style: TextStyle(fontSize: 14,color: Colors.white),),
                            onTap: (){}
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.02,),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return _customListView(width: width, height: height, title: 'Live Webinar ${index+1}');

                        }),
                    SizedBox(height: height*0.02,),
                    Text('Complete your remaining payment to attend the offline training',textAlign: TextAlign.center,),
                    SizedBox(height: height*0.03,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Offline Training',style: TextStyle(fontSize: 16),),
                        customContainer(bRadius: width*0.04,vPadding: height*0.005,containerColor: Colors.grey.shade600,
                            hPadding: width*0.02,
                            child: Text('Locked',style: TextStyle(fontSize: 14,color: Colors.white),),
                            onTap: (){}
                        ),

                      ],
                    ),
                    _customListViewTitle(width: width, height: height, title: 'Yet To Attend')
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
Widget _customTimeline({required String text,required VoidCallback onTap,required bool isSelected}){
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        !isSelected?Icon(Icons.circle_outlined,size: 30,color: Color.fromRGBO(0, 63, 136, 1),):Icon((Icons.circle),size: 30,color: Color.fromRGBO(0, 63, 136, 1),),
        Text(text,style: TextStyle(
          fontSize: 12,
        ),textAlign: TextAlign.center,),
      ],
    ),
  );
}
Widget _dash(double width){
  return customContainer(bRadius: 1,height: 2,width:width*0.3,containerColor:  Color.fromRGBO(0, 63, 136, 1));
}

Widget _customListView({required double width,required double height,required String title}){
  return Column(
    children: [
      Row(
        children: [
          customContainer(bRadius: width*0.02, width: width*0.25,height: height*0.07,containerColor: Colors.blue.shade200,
            child: Center(child: Text('T1',style: TextStyle(fontSize: 20,color: Colors.white),)),),
          SizedBox(width: width*0.01,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text('Lorem ipsum dolor sit amet, consectetur...',maxLines: 1,overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
          Icon(Icons.check_circle_outline_rounded,size: width*0.08,),
        ],
      ),
      SizedBox(height: height*0.01,),
    ],
  );
}
Widget _customListViewTitle({required double width,required double height,required String title}){
  return Column(

    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customContainer(bRadius: width*0.02, width: width*0.25,height: height*0.07,containerColor: Colors.blue.shade200,
            child: Center(child: Text('T1',style: TextStyle(fontSize: 20,color: Colors.white),)),),
          SizedBox(width: width*0.01,),
          Text(title),
          Icon(Icons.check_circle_outline_rounded,size: width*0.08,),
        ],
      ),
      SizedBox(height: height*0.01,),
    ],
  );
}