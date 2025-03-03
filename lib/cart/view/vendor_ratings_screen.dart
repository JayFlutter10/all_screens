import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_bizbooster/cart/view/give_rating_screen.dart';
import '../../constants/widgets/custom_container.dart';

class VendorRatingsScreen extends StatefulWidget {
  const VendorRatingsScreen({super.key});

  @override
  State<VendorRatingsScreen> createState() => _VendorRatingsScreenState();
}

class _VendorRatingsScreenState extends State<VendorRatingsScreen> {
  final List<dynamic> imageData=[
    'assets/vendor/img/avatar1.png',
    'assets/vendor/img/avatar2.png',
    'assets/vendor/img/avatar3.png',
    'assets/vendor/img/avatar4.png',
  ];
  final List<double> ratingPercentages = [73, 11, 50, 5, 4]; // Example data
  final String review='Reliable AC servicing! Professional, punctual, and efficient. Fixed issues quickly, ensured smooth cooling, and offered fair pricing. Highly recommended!';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:  CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(0, 80, 157, 1),
        middle: Text('Ratings',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Summary',
                  style: TextStyle(fontSize: 16,color: Colors.grey),
                ),
              ),
              SizedBox(height: height * 0.02),
              ///Review Summary
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Ratings Bar
                    Expanded(
                      child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return _rating(
                              number: '${5 - index}',
                              percentile: ratingPercentages[index],
                            );
                          }
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    ///Ratings Analytics
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('4.5', style: TextStyle(fontSize: 20),),
                                Icon(Icons.star, color: Color.fromRGBO(0, 80, 157, 1),)
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Text('273 Reviews', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),),
                          ],
                        ),
                        SizedBox(height: height*0.04,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('98%', style: TextStyle(fontSize: 20),),
                            SizedBox(height: height * 0.01),
                            Text('Recommended', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ],
                    )
                  ]
              ),

              ///Write a review button
              Center(
                child: customContainer(bRadius: width*0.04,
                  shadowColor: Colors.white,
                  borderColor: Colors.grey,
                  vPadding: height*0.015,
                  hPadding: width*0.3,
                  onTap: (){
                    Get.to(()=>GiveRatingScreen());
                  },
                  child: Text('Write a review',style: TextStyle(color: Colors.grey),)
                ),
              ),
              SizedBox(height: height*0.02,),
              ///Reviews
              Center(
                child: Text('Reviews',style: TextStyle(fontSize: 16,color: Colors.grey.shade500),),
              ),
              SizedBox(height: height*0.02,),
              ///User Review builder
              ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: height*0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Mansi Mulik',style: TextStyle(fontSize: 16,color: Color.fromRGBO(0, 80, 157, 1),fontWeight: FontWeight.w500),),
                                _userGivenStars(number: 5, height: height*0.05, size: width*0.05),
                              ],
                            ),
                            Text(review,style: TextStyle(fontSize: 14,color: Colors.grey),),
                            SizedBox(height: height*0.01,),
                            GridView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4)
                                , itemBuilder: (context,index){
                              return customContainer(bRadius: 0,
                                  margin: width*0.01,
                                  assetsImg: imageData[index],
                                  containerColor: Colors.blue,
                                  height: height*0.04,width: width*0.02
                              );
                            }),
                            SizedBox(height: height*0.01,),
                            Text('Nov 09, 2022',style: TextStyle(color: Colors.grey),),
                            Row(
                              children: [
                                Icon(CupertinoIcons.checkmark_circle,color: Colors.green,size: width*0.04,),
                                Text(' Recommended',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500),),
                              ],
                            ),
                            SizedBox(height: height*0.01,),
                          ],
                        ),
                      );
                    }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rating({required String number, required double percentile}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(number, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 5),
          Expanded(
            child: customContainer(
              bRadius: 10,
              height: 10,
              containerColor: Colors.blue,
              child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double availableWidth = constraints.maxWidth;
                    final double whiteWidth = availableWidth * (100 - percentile) / 100;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: whiteWidth > 0 ? whiteWidth : 0,
                          child: customContainer(
                              bRadius: 10,
                              containerColor: Colors.white
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text('$percentile%', style: const TextStyle(fontSize: 12)),
        ],
      ),
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
          return Icon(Icons.star,size: size,color: Color.fromRGBO(0, 80, 157, 1),);
        },),
      )
    ],
  );
}