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
              SizedBox(height: height*0.01,),
              
              ///Franchise Description and Ratings
              customContainer(bRadius: width*0.02,
                vPadding: height*0.01,
                hPadding: width*0.01,
                child: Column(
                  children: [
                    ///Quantity
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(widget.serviceName,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                        customContainer(
                          hPadding: width*0.02,
                          bRadius: height*0.01,
                          child: DropdownButton<String>(
                            underline: Container(),
                            value: selection,
                            elevation: 1,
                            dropdownColor: Colors.green.shade50,
                            hint: Text('QTY',style: TextStyle(fontSize: 14),),
                            selectedItemBuilder: (BuildContext context) {
                              return [
                                DropdownMenuItem(child: Text('1')),
                                DropdownMenuItem(child: Text('2')),
                                DropdownMenuItem(child: Text(customQtyController.text.isNotEmpty ? customQtyController.text : 'Custom')),
                              ];
                            },
                            items: [
                              DropdownMenuItem(value: 'option1', child: Text('1')),
                              DropdownMenuItem(value: 'option2', child: Text('2')),
                              DropdownMenuItem(
                                value: 'option3',
                                child: Text('Custom'),
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
              customContainer(bRadius: width*0.02,
              child: ListTile(
                title: Text('Preferable time',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                subtitle: Text('Choose a preferred time, and we will try our best to deliver it',style: TextStyle(fontSize: 14),),
                trailing: customContainer(vPadding:height*0.005,hPadding: width*0.07,bRadius: width*0.05,child: Text('Select',style: TextStyle(fontSize: 16,color: Colors.white),),containerColor: Color.fromRGBO(0,80, 157, 1),onTap: (){}),
              ),
              ),
              SizedBox(height: height*0.01,),
        
              customContainer(bRadius: width*0.02,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.store_outlined,size: height*0.025,),
                      Text('Franchise Details',style: TextStyle(fontSize: 14),)
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
              SizedBox(height: height*0.01,),

            ],
          ),
        ),
      ),
    );
  }
}
