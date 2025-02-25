import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

import '../../academy/widgets/tab_bar_widget.dart';

class CheckoutScreen extends StatefulWidget {
  final String serviceName;
  const CheckoutScreen({super.key, required this.serviceName});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    String? selection;
    List<String> list = ['Art', 'Sports', 'Coding', 'E-Sports', 'Other'];
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
        child: Column(
          children: [
            ///Tap Bar
            TapBarWithText(
              height: height, data: [
              {'icon': Icons.wallet, 'title': 'Details'},
              {'icon': Icons.shopping_bag_rounded, 'title': 'Payment'},
              {'icon': Icons.check_circle_outline_rounded, 'title': 'Complete'},
            ], width: width, colors: [
              Color.fromRGBO(0, 80, 157, 1),Colors.white
            ], iconColors: [
              Colors.white,Colors.grey
            ],
            ),
            SizedBox(
              height: height*0.03,
            ),
            
            ///Banner
            customContainer(bRadius:height*0.02,
              assetsImg: 'assets/cart/img/cart_banner.png',
              height: height*0.2,
            ),

            customContainer(bRadius: width*0.02,
              margin: height*0.01,
              vPadding: height*0.01,
              hPadding: width*0.01,
              child: Column(
                children: [
                  Row(
                    children: [
                        Text(widget.serviceName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
                  ],),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 130, 130),
                    ),
                    margin: const EdgeInsets.all(20),
                    child: DropdownButton<String>(
                      hint: const Text(
                        "QTY",style: TextStyle(fontSize: 12),
                      ),
                      value: selection,
                      onChanged: (String? newValue) {
                        setState(() {
                          selection = newValue;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}
Widget _dash({required double width}){
  return customContainer(bRadius: 10,
    height: 2,
    width: width,
    containerColor: Color.fromRGBO(0, 80, 157, 1)
  );
}

Widget _circleAvatarIcon({required Color color,required double height,required Icon icon,required String title,VoidCallback? onTap,required int selectedIndex}){
  return Column(
    children: [
      customContainer(
        containerColor:color ,
        onTap: onTap,
        margin: height*0.001,
        borderColor: Color.fromRGBO(0, 80,157, 1),
        hPadding: height*0.02,
        vPadding: height*0.02,
        bRadius:height*0.044 ,
        child: icon,
      ),
      Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)
    ],
  );
}

