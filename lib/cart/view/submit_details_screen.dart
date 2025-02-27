import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

import '../../constants/widgets/row_text_field_widget.dart';
import 'checkout_screen.dart';

class SubmitDetailsScreen extends StatefulWidget {
  const SubmitDetailsScreen({super.key});

  @override
  State<SubmitDetailsScreen> createState() => _SubmitDetailsScreenState();
}

class _SubmitDetailsScreenState extends State<SubmitDetailsScreen> {
  final String serviceName='Amazon Merchant Onboarding';
  final TextEditingController nameController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController addressController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.03),
          child: Column(
            children: [
               ///Customer Details
               Center(child: Text('Customer Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
               customContainer(
                vPadding: height*0.015,
                hPadding: width*0.02,
                margin: width*0.01,
                bRadius: width*0.02,
                child:Column(
                      children: [
                        rowTextField(name: 'Name',width:width*0.03,height: height*0.05,controller:nameController,isManda: true),
                        SizedBox(height: height*0.02,),
                        rowTextField(name: 'Mobile No.',width:width*0.03,height: height*0.05,controller:phoneController,isManda: true),
                        SizedBox(height: height*0.02,),
                        rowTextField(name: 'Address',width:width*0.03,height: height*0.05,controller:addressController,isManda: true),
                        SizedBox(height: height*0.03,),
                        Text('Requirements',style: TextStyle(fontSize: 14,color: Colors.grey),),
                        SizedBox(height: height*0.02,),
        
                      ],
                    )
              ),
              SizedBox(height: height*0.03,),

              ///Service Details
              Text('Service Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: height*0.02,),
              customContainer(
                bRadius: width*0.02,
                vPadding: height*0.02,
                hPadding: width*0.02,
                child: Column(
                  children: [
                    rowTextField(name: 'Service Name', width:width*0.03,height: height*0.05,hintText: serviceName,),
                    SizedBox(height: height*0.02,),
                    rowTextField(name: 'Module', width:width*0.03,height: height*0.05,hintText: 'Onboarding')
                  ],
                ),
              ),
              SizedBox(height: height*0.02,),

              ///Mandatory Field Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('*',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.red,),),
                  Text('indicates mandatory fields',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                ],
              ),

              ///Checkout button
              Container(
                margin: EdgeInsets.symmetric(vertical: height*0.02),
                width: width,
                child: ElevatedButton(
                  onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutScreen(serviceName: serviceName,)));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color.fromRGBO(0, 80, 157, 1),
                  ), child: Text('Proceed To Checkout',style: TextStyle(fontSize: 16,color: Colors.white),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
