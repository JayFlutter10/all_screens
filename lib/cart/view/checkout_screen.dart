import 'package:flutter/material.dart';
import 'package:side_bizbooster/cart/view/fill_loader.dart';
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
  TextEditingController customQtyController=TextEditingController();
  String? selection;
  String getDisplayText() {
    if (selection == 'option1') return '1';
    if (selection == 'option2') return '2';
    if (selection == 'option3') {
      if (customQtyController.text.isNotEmpty) {
        return customQtyController.text;
      } else {
        return 'Custom';
      }
    }
    return 'QTY';  // Default hint
  }

  @override
  void dispose() {
    customQtyController.dispose();
    super.dispose();
  }
  List<dynamic> data=[

    {'icon': Icons.wallet, 'title': 'Details'},
    {'icon': Icons.shopping_bag_rounded, 'title': 'Payment'},
    {'icon': Icons.check_circle_outline_rounded, 'title': 'Complete'},
  ];
  int stepCount = 0;
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
          child: Column(
            children: [
              ///Tap Bar
              TapBarWithText(
                height: height, data: data, width: width, colors: [
                Color.fromRGBO(0, 80, 157, 1),Colors.white
              ], iconColors: [
                Colors.white,Colors.grey
                ],
              ),

              SizedBox(
                height: height*0.03,
              ),

              ///Banner Image
              customContainer(bRadius:height*0.02,
                assetsImg: 'assets/cart/img/cart_banner.png',
                height: height*0.2,
              ),
              SizedBox(height: height*0.01,),

              ///Franchise Description and Ratings
              customContainer(bRadius: width*0.04,
                vPadding: height*0.01,
                hPadding: width*0.01,
                child: Column(
                  children: [
                    ///Quantity
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.serviceName,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                        customContainer(
                          hPadding: width*0.02,
                          bRadius: height*0.01,
                          child: DropdownButton<String>(
                            underline: Container(),
                            value: selection,
                            elevation: 1,
                            dropdownColor: Colors.white,
                            hint: Text('QTY',style: TextStyle(fontSize: 14),),
                            selectedItemBuilder: (BuildContext context) {
                              return [
                                DropdownMenuItem(child: Text('1',style: TextStyle(fontSize: 12))),
                                DropdownMenuItem(child: Text('2',style: TextStyle(fontSize: 12))),
                                DropdownMenuItem(child: Text(customQtyController.text.isNotEmpty ? customQtyController.text : 'Custom',style: TextStyle(fontSize: 12))),
                              ];
                            },
                            items: [
                              DropdownMenuItem(value: 'option1', child: Text('1',style: TextStyle(fontSize: 12))),
                              DropdownMenuItem(value: 'option2', child: Text('2',style: TextStyle(fontSize: 12))),
                              DropdownMenuItem(
                                value: 'option3',
                                child: Text('Custom',style: TextStyle(fontSize: 12),),
                                onTap: () {
                                  Future.delayed(
                                    Duration.zero,
                                        () => showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Custom Quantity'),
                                          content: TextField(
                                            controller: customQtyController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Enter quantity',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Save the custom quantity value and refresh UI
                                                setState(() {
                                                  selection = 'option3';
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selection = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    ///Ratings
                    Row(
                      children: [
                        customContainer(bRadius:height*0.01,
                            vPadding: height*0.002,
                            hPadding: width*0.01,
                            containerColor: Color.fromRGBO(0, 80, 157,1),
                            child: Row(
                              children: [
                                Text('4.5',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),),
                                SizedBox(width: width*0.01,),
                                Icon(Icons.star_border,color: Colors.white,size: width*0.05,),
                              ],
                            )
                        ),
                        SizedBox(width: width*0.01,),
                        Text('& 55 Reviews',style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    ///Pricing
                    Row(
                      children: [
                        Text('₹0000',style: TextStyle(fontSize: 14,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.w500),),
                        SizedBox(width: width*0.03,),
                        Text('₹0000',style: TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.w600),),
                        SizedBox(width: width*0.03,),
                        Text('00% Discount',style: TextStyle(fontSize: 14,color: Colors.black54,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.01,),

              ///Preferable Time
              customContainer(bRadius: width*0.04,
                child: ListTile(
                  title: Text('Preferable time',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  subtitle: Text('Choose a preferred time, and we will try our best to deliver it',style: TextStyle(fontSize: 12),),
                  trailing: customContainer(vPadding:height*0.005,hPadding: width*0.07,bRadius: width*0.05,child: Text('Select',style: TextStyle(fontSize: 16,color: Colors.white),),containerColor: Color.fromRGBO(0,80, 157, 1),onTap: (){}),
                ),
              ),
              SizedBox(height: height*0.02,),

              ///Franchise Details
              customContainer(bRadius: width*0.04,
                vPadding: height*0.015,hPadding: width*0.02,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.store_outlined,size: height*0.026,),
                        SizedBox(width: width*0.02,),
                        Text('Franchise Details',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.all(width*0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mansi Mulik'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('+91 911261845'),
                              Row(
                                children: [
                                  Icon(Icons.call,color: Color.fromRGBO(0, 80, 157, 1),),
                                  SizedBox(width: width*0.03,),
                                  Icon(Icons.mail_outline_rounded,color: Color.fromRGBO(0, 80, 157, 1)),
                                  SizedBox(width: width*0.03,),
                                  Icon(Icons.chat_rounded,color: Color.fromRGBO(0, 80, 157, 1))
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),),
              SizedBox(height: height*0.02,),

              ///Customer Details
              customContainer(bRadius: width*0.04,vPadding: height*0.015,hPadding: width*0.02,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Icon(Icons.person_outlined,size: height*0.026,),
                      SizedBox(width: width*0.02,),
                      Text('Customer Details',style: TextStyle(fontWeight: FontWeight.w500),),
                    ],),
                    customContainer(
                        margin: height*0.01,
                        bRadius: width*0.02,
                        vPadding: height*0.005,
                        hPadding: width*0.02,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Satish Kadam',style: TextStyle(fontSize: 16),),
                                Text('+91 911261845'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.call,color: Color.fromRGBO(0, 80, 157, 1),),
                                SizedBox(width: width*0.03,),
                                Icon(Icons.mail_outline_rounded,color: Color.fromRGBO(0, 80, 157, 1)),
                                SizedBox(width: width*0.03,),
                                Icon(Icons.chat_rounded,color: Color.fromRGBO(0, 80, 157, 1))
                              ],
                            ),
                          ],
                        )
                    ),
                    Text('Saved Address'),
                    customContainer(
                        margin: height*0.01,
                        bRadius: width*0.02,
                        vPadding: height*0.005,
                        hPadding: width*0.02,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.circle_outlined,color: Colors.red,),
                            SizedBox(width: width*0.01,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Satish Kadam',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  Text('Lorem Ipsum Lorem Ipsum Lorem Ipsum',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: (){},
                                child: Text('+Add New Address',style: TextStyle(fontSize: 14,color: Colors.red),))
                          ],
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.02,),

              ///Cart Summary
              customContainer(bRadius: width*0.04,vPadding: height*0.015,hPadding: width*0.04,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.shopping_cart_outlined,size: height*0.026,),
                              SizedBox(width: width*0.02,),
                              Text('Cart Summary',style: TextStyle(fontWeight: FontWeight.w500),),
                            ],
                          ),
                          SizedBox(height: height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Amazon Merchant Onboarding',),
                              Text('(1)'),
                              Text('₹0,000',style: TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                      Text('Merchant Onboarding',style: TextStyle(color: Colors.grey),),
                      SizedBox(height: height*0.02,),
                      Divider(color: Colors.grey.shade200,),
                      SizedBox(height: height*0.02,),
                      _rowText(text1: 'Sub Total', text2: '₹0,000',isLast: false),
                      _rowText(text1: 'Discount', text2: '₹0,000',isLast: false),
                      _rowText(text1: 'Campaign Discount', text2: '₹0,000',isLast: false),
                      _rowText(text1: 'VAT', text2: '₹0,000',isLast: false),
                      SizedBox(height: height*0.02,),
                      Divider(color: Colors.grey.shade200,),
                      SizedBox(height: height*0.02,),
                      _rowText(text1: 'Grand Total', text2: '₹0,000',isLast: true),

                    ],
                  )
              ),
              SizedBox(height: height*0.02,),

              ///Your earnings label
              Container(
                  padding: EdgeInsets.symmetric(vertical:height*0.01 ,horizontal: width*0.04,),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(8, 208, 8, 0.1),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(width*0.04),bottomRight: Radius.circular(width*0.04))
                  ),
                  child: Column(
                    children: [
                      RichText(text: TextSpan(
                          text: 'You Will Earn',style: TextStyle(fontSize: 14,color: Colors.green,fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: ' ₹000 ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                                text: 'Commission'
                            ),
                          ]
                      )),
                      Text('From This Product',style: TextStyle(fontSize: 14,color: Colors.green,fontWeight: FontWeight.w500),)
                    ],
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}
Widget _rowText({required String text1,required String text2,required bool isLast}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(text1,style: TextStyle(fontWeight: isLast?FontWeight.w500:FontWeight.w100,fontSize: isLast?16:14),),
      Text(text2,style: TextStyle(fontWeight: isLast?FontWeight.w500:FontWeight.w100,fontSize: isLast?16:14,color: Colors.green),)
    ],
  );

}