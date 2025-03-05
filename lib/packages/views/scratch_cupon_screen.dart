import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';
import 'package:side_bizbooster/custom_widgets/views/offer_package_screen.dart';

import '../../constants/widgets/custom_container.dart';

class ScratchCuponScreen extends StatefulWidget {
  const ScratchCuponScreen({super.key});

  @override
  State<ScratchCuponScreen> createState() => _ScratchCuponScreenState();
}

class _ScratchCuponScreenState extends State<ScratchCuponScreen> {
  bool isScratched=false;
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
            children: [
              Column(
                children: [
                  Text('CONGRATULATIONS!🎉',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.blue),),
                  Text('Here is your scratch card',style: TextStyle(fontSize: 16,color: Colors.grey),),
                ],
              ),
              SizedBox(height: height*0.05,),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      customContainer(
                      width: width*0.8,height: height*0.4,
                      containerColor: isScratched?Colors.white:Colors.grey,
                      shadowColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      bRadius: width*0.04,
                      child: Scratcher(
                          onScratchEnd: (){
                            setState(() {
                              isScratched=true;
                            });
                          },
                          image: Image.asset('assets/scratch/img/gray.png'),
                          brushSize: 90,
                          child: Center(
                              child: customContainer(
                                bRadius: height*2,
                                child: customContainer(
                                  borderColor: Colors.blue,
                                    containerColor: Colors.blue,
                                    bRadius:height*2,width: width*0.52,height: height*0.24,
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(()=>OfferPackageScreen());
                                    },
                                    child: Column(
                                      children: [
                                        SizedBox(height: height*0.05,),
                                        Text('80 %',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),
                                        Text('Discount',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ],
                                    ),
                                  )
                                ),
                              )
                          )),
                    ),
                    ]
                  ),
                ],
              ),
              SizedBox(height: height*0.1,),
              isScratched==false?Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You Are Eligible',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),
                    Text('For Pre Launch',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                    Text('Discount',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                  ],
                ),
              ):Container(),

              isScratched==true?Text('You Are Eligible',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w500)):Container(),
              Text('Pre Launch Discount',style: TextStyle(fontSize: 30,color:Color.fromRGBO(0, 80, 157, 1),fontWeight: FontWeight.w500),)
            ]
        ),
      ),
    );
  }
}
