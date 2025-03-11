import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/style/text_styles.dart';

import '../../constants/widgets/custom_container.dart';

class OfflineEventScreen extends StatefulWidget {
  const OfflineEventScreen({super.key});

  @override
  State<OfflineEventScreen> createState() => _OfflineEventScreenState();
}

class _OfflineEventScreenState extends State<OfflineEventScreen> {
  final List<dynamic> placeName=[
    'Delhi NCR','Pune','Bengaluru','Chennai','Jaipur','Kolkata',
  ];
  final String aboutEvent='Launching Your First Franchise" is an offline event designed for aspiring entrepreneurs and business owners who want to expand their ventures through franchising. This event provides valuable insights into the franchise model, covering key topics like legal requirements, investment strategies, franchise operations, and scaling business growth.';
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline Event'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.02),
          child: Column(
            children: [
              ///Selection For City
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    showDragHandle: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width*0.05)
                      ),
                      context: context, builder:(BuildContext context){
                    return SizedBox(
                      height: height*0.5,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: height*0.03,horizontal: width*0.03 ),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            ListView.builder(
                              itemCount: placeName.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index){
                              return Column(
                                children: [
                                  customContainer(bRadius: width*0.04,vPadding: height*0.01,borderColor:selectedIndex==index? Color.fromRGBO(0, 80, 157, 1):Colors.white,
                                    hPadding: width*0.02,hMargin: width*0.01,
                                    onTap: (){
                                    setState(() {
                                      selectedIndex=index;
                                    });
                                    Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                          Image.asset('assets/offline_event/img/india_gate.png'),
                                          SizedBox(width: width*0.03,),
                                          Text(placeName[index].toString(),style: textStyle16(context),),
                                      ],
                                    )
                                  ),
                                  SizedBox(height: height*0.01,),
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                    );
                  } );
                },
                child: Row(
                  children: [
                    Image.asset('assets/offline_event/img/india_gate.png',scale: 0.8,),
                    SizedBox(width: width*0.02,),
                    Text(placeName[selectedIndex].toString(),style: textStyle16(context),),
                    SizedBox(width: width*0.01,),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),
              SizedBox(
                height: height*0.02,
              ),
        
              ///Search Field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search by city',
                  prefixIcon: Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(width*0.04),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    borderRadius: BorderRadius.circular(width*0.04)
                  )
                ),
              ),
              SizedBox(height: height*0.02,),
        
              ///Text and Banner
              Text('Free Stay on your first offline training',style: textStyle16(context),),
             Image.asset('assets/offline_event/img/Alt Slide 01.png'),
              SizedBox(height: height*0.02,),
        
              ///Event Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Webinar 2025',style: textStyle18(context),),SizedBox(height: height*0.02,),
                  customContainer(bRadius: width*0.02,vPadding: height*0.01,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _rowIconText(icon: Icons.people, title: 'Webinar', width: width),
                              SizedBox(height: height*0.01,),
                              _rowIconText(icon: Icons.calendar_month, title: 'March 8th & 9th', width: width),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _rowIconText(icon: Icons.location_pin, title: 'Lorem Stadium', width: width),
                              SizedBox(height: height*0.01,),
                              _rowIconText(icon: Icons.access_time_rounded, title: '11 AM - 01 PM', width: width),
                            ],
                          )
                        ],
                      )
                  )
                ],
              ),
              SizedBox(height: height*0.02,),

              ///About Event
              customContainer(bRadius: width*0.02,vPadding: height*0.01,hPadding: width*0.04,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About Event',style: textStyle16(context),),
                    Text(aboutEvent),
                  ],
                )),
              SizedBox(height: height*0.02,),

              ///Provided Freebies
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconColumnText(icon: Icons.fastfood_rounded, title: 'Food', width: width, height: height, context: context),
                  SizedBox(width: width*0.01,),
                  _iconColumnText(icon: Icons.hotel, title: 'Stay', width: width, height: height, context: context),
                  SizedBox(width: width*0.01,),
                  _iconColumnText(icon: Icons.language_rounded, title: 'Language', width: width, height: height, context: context),
                  SizedBox(width: width*0.01,),
                  _iconColumnText(icon: Icons.access_time_rounded, title: 'Duration', width: width, height: height, context: context),
                ],
              ),
              SizedBox(height: height*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Provided',style: textStyle14(context),),
                  Text('Provided',style: textStyle14(context),),
                  Text('English/Hindi',style: textStyle14(context),),
                  Text('2 Days',style: textStyle14(context),),
                  ],
              ),
              SizedBox(height: height*0.02,),

              ///Address
              Stack(
                alignment: Alignment.center,
                children: [
                  customContainer(bRadius: width*0.04,vPadding: height*0.01,hPadding: width*0.04,
                  height: height*0.2,
                  assetsImg: 'assets/offline_event/img/map_background.png'
                   ),
                customContainer(bRadius: width*0.02,width: width*0.8,vPadding: height*0.005,hPadding: width*0.01,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_pin,size: width*0.09,color: Color.fromRGBO(0, 80, 157, 1),),
                      SizedBox(width: width*0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Event Address',style: textStyle16(context,color: Color.fromRGBO(0, 80, 157, 1)),),
                            Text('2972 Westheimer Rd. Santa Ana, Illinois 85486',style: textStyle16(context),),
                          ],
                        ),
                      )
                    ],
                  )
                ),
                ]
              ),

              SizedBox(height: height*0.1,),
              customContainer(
                shadowColor: Colors.transparent,
                bRadius: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Entry',style: textStyle16(context,color: Colors.grey),),
                        Text('Free of cost',style: textStyle18(context),)
                      ],
                    ),
                    customContainer(bRadius: width*0.02,vPadding: height*0.015,hPadding: width*0.04,containerColor: Color.fromRGBO(0, 80, 157, 1),
                    child: Text('Book Now',style: textStyle18(context,color: Colors.white),),
                    )
                  ],
                ),
              ),
              SizedBox(height: height*0.1,),

            ],
          ),
        ),
      ),
    );
  }
}
Widget _rowIconText({required IconData icon,required String title,required double width}){
  return Row(
    children: [
      Icon(icon),
      SizedBox(width: width*0.02,),
      Text(title)
    ],
  );
}

Widget _iconColumnText({required IconData icon,required String title,required double width,required double height,required  BuildContext context}){
 
  return customContainer(
    bRadius: width*0.04,vPadding:height*0.01,hPadding: width*0.01,width: width*0.23,
    child: Column(
      children: [
          Icon(icon,size: height*0.04,),
          Text(title,style: textStyle12(context),)
      ],
    ),
  );
}
