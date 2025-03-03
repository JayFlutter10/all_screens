import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_bizbooster/cart/view/vendor_ratings_screen.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';
import 'package:palette_generator/palette_generator.dart';


class VendorDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String serviceTitle;
  final bool isAvailable;
  final String address;
  const VendorDetailsScreen({super.key, required this.serviceTitle, required this.isAvailable, required this.address, required this.imagePath});

  @override
  State<VendorDetailsScreen> createState() => _VendorDetailsScreenState();
}

class _VendorDetailsScreenState extends State<VendorDetailsScreen> {
  Color? backgroundColor;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _updateBackgroundColor();
  }

  Future<void> _updateBackgroundColor() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      Image.asset(widget.imagePath).image,
    );
    setState(() {
      backgroundColor = generator.dominantColor?.color ?? Colors.white;
      isLoading = false;
    });
  }

  List<dynamic> acServicesList=[
    'AC Servicing','AC Cooling Problem','AC Installation'
  ];
  bool isSelected=true;
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CupertinoNavigationBar(middle: Text('Vendor Details',style: TextStyle(fontSize: 16,color: Colors.white),),backgroundColor: Color.fromRGBO(0, 80, 157,1),),
      body: CustomScrollView(
        slivers: [
          ///AppBar
          SliverAppBar.large(
            pinned: false,
            floating: false,
            expandedHeight: height*0.25,
            iconTheme: IconThemeData(color: Colors.transparent),
            flexibleSpace: FlexibleSpaceBar(
              background: customContainer(
                   bRadius: 0,
                  child: Image.asset(widget.imagePath)),
            ),
          ),


          ///Service Details
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.serviceTitle,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>VendorRatingsScreen()));
                        },
                        child: Row(
                          children: [
                            Text('4.5 ',style: TextStyle(fontSize: 16,color: Color.fromRGBO(0, 80, 157, 1),fontWeight: FontWeight.w500),),
                            Icon(Icons.star_border, size: width*0.05,color: Color.fromRGBO(0, 80, 157, 1)),
                             Text(' 5 Reviews',style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height*0.01), // Adding space between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _availability(width: width, isAvailable: widget.isAvailable,onTap: (){
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width*0.1)
                            ),
                            context: context, builder:(BuildContext context){
                          return SizedBox(
                            height: height*0.32,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: height*0.03,horizontal: width*0.03 ),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                  Text('Availability',style: TextStyle(fontSize: 16,),),
                                  _iconTextRow(text: 'Today available till 11:30 PM', icon:Icons.access_time_rounded, size: width*0.04,iconColor: Colors.grey),
                                  SizedBox(height: height*0.04,),
                                  Text('Usually available from',style: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w500),),
                                  Text('06 : 00 AM - 11:30 PM',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  Text('Monday - Friday',style: TextStyle(fontSize: 14,color: Colors.grey),),
                                  SizedBox(height: height*0.04,),
                                  Row(
                                    children: [
                                      Text('Day off',style: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w500),),
                                      SizedBox(width: width*0.02,),
                                      Text('Saturday - Sunday',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        } );
                      }),
                      _iconTextRow(
                          text: 'Pune',
                          icon: CupertinoIcons.map_pin,
                          size: width*0.04,
                          iconColor: Colors.red
                      )
                    ],
                  ),
                  SizedBox(height: height*0.01), // Adding space between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.address,
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      _iconTextRow(text: '2.8 KM Away', icon: Icons.map, size: width*0.04,),
                    ],
                  )
                ],
              ),
            ),
          ),

          ///Other Services Tap Bar
          SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: height*0.03,horizontal: width*0.02),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade200
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(width*0.1),topRight:Radius.circular(width*0.1) )
                  ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height*0.03,
                      child: ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: acServicesList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                        return customContainer(bRadius: 0,hPadding: width*0.04,borderColor: Colors.transparent,shadowColor: Colors.white,
                           onTap: (){
                             setState(() {

                              });
                           },
                            child: Text(acServicesList[index],style: TextStyle(fontSize: 14),));
                      }),
                    ),
                    Text('')
                  ],
                )
            ),
          ),

          ///Other Services
          SliverToBoxAdapter(
            child:
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AC Servicing'),
                  SizedBox(height: height*0.02,),
                  SizedBox(
                    height: height*0.3,

                    child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                      return customContainer(
                        shadowColor: Colors.white,
                        hMargin: width*0.02,
                        bRadius: width*0.01,
                        width: width*0.62,
                        child: Column(
                          children: [
                            _servicesOther(bRadius: width*0.05, image: 'assets/vendor/img/service_banner_1.png', borderColor: Colors.red, title: '10% off', height: height*0.17, padding: width*0.01, description: 'Basic AC Servicing', onTapLike: () {  },)
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

          ),
          SliverToBoxAdapter(
            child:
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AC Servicing'),
                  SizedBox(height: height*0.02,),
                  SizedBox(
                    height: height*0.3,

                    child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                      return customContainer(
                        shadowColor: Colors.white,
                        hMargin: width*0.02,
                        bRadius: width*0.01,
                        width: width*0.55,
                        child: Column(
                          children: [
                            _servicesOther(bRadius: width*0.04, image: 'assets/vendor/img/service_banner_1.png', borderColor: Colors.red, title: '10% off', height: height*0.15, padding: width*0.01, description: 'Basic AC Servicing', onTapLike: () {  },)
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

          ),
          SliverToBoxAdapter(
            child:
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AC Servicing'),
                  SizedBox(height: height*0.02,),
                  SizedBox(
                    height: height*0.3,

                    child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                      return customContainer(
                        shadowColor: Colors.white,
                        hMargin: width*0.02,
                        bRadius: width*0.01,
                        width: width*0.55,
                        child: Column(
                          children: [
                            _servicesOther(bRadius: width*0.04, image: 'assets/vendor/img/service_banner_1.png', borderColor: Colors.red, title: '10% off', height: height*0.15, padding: width*0.01, description: 'Basic AC Servicing', onTapLike: () {  },)
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

          ),

        ],
      )
    );
  }
}

Widget _iconTextRow({required String text,required IconData icon,required double size,Color? iconColor,Color? textColor,}){
  return Row(
    children: [
      Icon(icon,size:size,color: iconColor??Colors.black,),
      SizedBox(width: size*0.2,),
      Text(text,style:TextStyle(fontSize: 14,color:textColor?? Colors.grey,fontWeight: FontWeight.w500) ,),
    ],
  );
}

Widget _availability({required double width,required bool isAvailable,VoidCallback? onTap}){
  return customContainer(bRadius: width*0.04,
    borderColor: isAvailable?Colors.green:Colors.white,
    width: isAvailable?width*0.29:width*0.35,
    hPadding: width*0.01,
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.circle,color: isAvailable? Colors.green:Colors.red,),
        Text(isAvailable?'Available':'Unavailable',style: TextStyle(fontSize: 14,color:isAvailable?Colors.green:Colors.red,fontWeight: FontWeight.w500),),
      ],
    ),
  );
}

Widget _servicesOther({
      required String description,
      required double bRadius,
      required double height,
      required String image,
      required Color borderColor,
      required String title,
      required double padding,
      required VoidCallback onTapLike,
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(bRadius),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top-left container
                  _containerCurved(radius: bRadius, borderColor: Colors.red, title: title, topLeft: bRadius, bottomRight: bRadius, padding: padding, textColor: Colors.red),

                  // Top-right heart icon
                  IconButton(onPressed: onTapLike, icon: Icon(CupertinoIcons.heart, color: Colors.white,),),
                ],
              ),

              // Spacer to push the share button to the bottom
              Spacer(),

              // Bottom row with share button aligned to the right
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _containerCurved(
                      radius: bRadius,
                      borderColor: Colors.white,
                      title: 'Share',
                      topLeft: bRadius,
                      bottomLeft: bRadius,
                      padding: padding
                  ),
                ],
              ),
            ],
          )
      ),
      Text(description),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Start From',style: TextStyle(fontSize: 12,color: Colors.grey),),
              Row(children: [
                Text('₹000',style: TextStyle(fontSize: 14,color: Color.fromRGBO(0, 80,157, 1))),
                Text('₹000',style: TextStyle(fontSize: 12,color: Colors.red,decoration: TextDecoration.lineThrough,decorationColor: Colors.red)),
              ],),
            ],
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Color.fromRGBO(0, 80, 157, 1),))
        ],
      ),
      Text('Earn Up to 000/-',style: TextStyle(fontSize: 14,color: Colors.green,fontWeight: FontWeight.w500),)
    ],
  );
}

Widget _containerCurved({required double padding,required double radius, Color? borderColor,required String title,Color? textColor, double? topLeft, double? bottomLeft, double? bottomRight,VoidCallback? onTap }){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(topLeft??0) ,bottomRight: Radius.circular(bottomRight??0),bottomLeft:Radius.circular(bottomLeft??0) ),
        border: Border.all(
          color: borderColor??Colors.white
        ),
      ),
      child: Text(title,style: TextStyle(color:textColor??Color.fromRGBO(0, 80, 157, 1) ),),
    ),
  );
}
