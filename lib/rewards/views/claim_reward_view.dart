import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/widgets/custom_container.dart';

class ClaimRewardView extends StatefulWidget {
  final String imageBanner;
  final String iconImage;
  final String companyName;
  final String offerText;

   const ClaimRewardView({super.key, required this.imageBanner, required this.iconImage, required this.companyName, required this.offerText});

  @override
  State<ClaimRewardView> createState() => _ClaimRewardViewState();
}

class _ClaimRewardViewState extends State<ClaimRewardView> {
   bool isRedeemed=false;
  final List<dynamic> details=[
    {
      'icon':CupertinoIcons.calendar,
      'title':'Expires on 00-00-0000, 11:59 PM',
      'subtitle':'',
    },
    {
      'icon':CupertinoIcons.bag,
      'title':'Offer Details',
      'subtitle':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl at fermentum tincidunt, lorem libero dictum odio, non gravida nisi justo vel lorem. Vivamus ultricies, lectus sed cursus gravida, risus libero convallis tortor, vel molestie neque magna a metus. Proin vel turpis id lacus aliquet eleifend ut ac arcu. Ut at felis nec quam laoreet tincidunt Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl at fermentum tincidunt, lorem libero dictum odio, non gravida nisi justo vel lorem. Vivamus ultricies, lectus sed cursus gravida, risus libero convallis tortor, vel molestie neque magna a metus. Proin vel turpis id lacus aliquet eleifend ut ac arcu. Ut at felis nec quam laoreet tincidunt',
    },
    {
      'icon':CupertinoIcons.doc,
      'title':'Terms And Conditions',
      'subtitle':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl at fermentum tincidunt, lorem libero dictum odio, non gravida nisi justo vel lorem. Vivamus ultricies, lectus sed cursus gravida, risus libero convallis tortor, vel molestie neque magna a metus. Proin vel turpis id lacus aliquet eleifend ut ac arcu. Ut at felis nec quam laoreet tincidunt Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl at fermentum tincidunt, lorem libero dictum odio, non gravida nisi justo vel lorem. Vivamus ultricies, lectus sed cursus gravida, risus libero convallis tortor, vel molestie neque magna a metus. Proin vel turpis id lacus aliquet eleifend ut ac arcu. Ut at felis nec quam laoreet tincidunt',
    },
  ];

  final TextEditingController _controller = TextEditingController(text: 'Fixed Text');

  int selection =0;

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.02),
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              ///AppBar
              SliverAppBar.large(
                expandedHeight: height*0.3,
                flexibleSpace:
                FlexibleSpaceBar(
                  background: Image.asset(widget.imageBanner,fit: BoxFit.cover,),
                ),
              ),

              ///Like Dislike
              SliverToBoxAdapter(
                child:Padding(
                  padding:  EdgeInsets.all(width*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(radius: height*0.04,backgroundImage: AssetImage(widget.iconImage),),
                          SizedBox(width: width*0.05,),
                          Text(widget.companyName
                            //,style: textStyle16(context),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: Color.fromRGBO(0, 80, 157, 0.3),child: InkWell(onTap: (){

                          }, child: Icon(CupertinoIcons.hand_thumbsup,color: Colors.white,)),),
                          SizedBox(width: width*0.05,),
                          CircleAvatar(backgroundColor: Color.fromRGBO(0, 80, 157, 0.3), child: Icon(CupertinoIcons.hand_thumbsdown,color: Colors.white,))
                        ],
                      )
                    ],
                  ),
                ),
              ),

              ///Offer Description
              SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsets.only(left:width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.offerText
                        //,style: textStyle18(context),
                      ),
                      Text('+ Free delivery on orders above 199'
                        //,style: textStyle14(context,color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),

              ///Copy Redeem Code
              SliverToBoxAdapter(
                child: customContainer(
                  height: height*0.05,
                  borderColor: Colors.grey.shade500,
                  margin: 10,
                  bRadius: 20,
                  child: TextFormField(
                    style: TextStyle(letterSpacing: 6,fontSize: 18,),
                    decoration: InputDecoration(
                      contentPadding:EdgeInsets.only(left:width*0.05,top: height*0.015),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: (){
                        Clipboard.setData(ClipboardData(text: _controller.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Center(child: Text("Copied to clipboard!"
                            //,style: textStyle16(context,color: Colors.white),
                          )),backgroundColor: Color.fromRGBO(0, 80, 157, 1),),
                        );
                      }, icon: Icon(Icons.copy,size:width*0.05,),)
                    ),
                    controller:_controller,
                    readOnly: true,
                    obscureText: true,
                  ),
                )
                ),

              ///Expiry,Offer Details & Terms and Conditions
              SliverToBoxAdapter(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: details.length,
                      itemBuilder: (context,index){
                    return _expansion(headline: details[index]['title'], icon: details[index]['icon'], context: context,selection: index==0?false:true, data: details[index]['subtitle'], width: width*0.02);
                  }),
                ),

              ///Redeem Now button
              SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      isRedeemed=true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color.fromRGBO(0, 80, 157, 1),
                  ), child: Text('Redeem Now',style: TextStyle(fontSize: 16,color: Colors.white),),
              )
              ),

              SliverToBoxAdapter(
                child:  Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height*0.01,
                    horizontal: width*0.01
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle_rounded,color: Colors.green,size: width*0.15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Thank you!',style: TextStyle(fontSize: 16),),
                              Text('Your order #BE12345 has been placed.'),
                            ],
                          )
                        ],
                      ),

                      customContainer(
                        borderColor: Colors.transparent,
                        bRadius: width*0.01,
                        vPadding: height*0.01,
                        hPadding: width*0.02,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text('Time placed: 00/00/0000 00:00',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                          SizedBox(height: height*0.01,),
                          Text('Shipping',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),

                            Padding(
                              padding:EdgeInsets.only(left: width*0.05,top: height*0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Satish Kadam',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                                  Text('satishkadam@gmail.com'),
                                  Text('+91 0000000000'),
                                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
                                ],
                              ),
                            )
                        ],),
                      ),
                      SizedBox(height: height*0.02,),
                      customContainer(
                        height: height*0.06,
                        bRadius: 0,
                        containerColor: Color.fromRGBO(255, 249,219, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fire_truck_outlined,size: width*0.08,),
                            Text('Arrives by April 3 to April 9th',style: TextStyle(fontSize: 16),)
                          ],
                        ),
                      ),
                      SizedBox(height: 50,)
                    ],
                  ),
                )

              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _expansion({required String headline,required IconData icon,required bool selection,required String data,required double width, required BuildContext context}){
  return ExpansionTile(
    iconColor: Colors.grey,
    shape: RoundedRectangleBorder(
      side: BorderSide.none
    ),
      title:Row(
        children: [
          Icon(icon,color: Colors.grey,),
          SizedBox(width: width,),
          Text(headline
            //,style: textStyle16(context,color: Colors.grey),
          ),
        ],
      ),
      childrenPadding: EdgeInsets.all(12),
      showTrailingIcon: selection,
      children:[ 
        Text(data
    //,style: textStyle14(context,color: Colors.grey
          ),
      ]
  );
}