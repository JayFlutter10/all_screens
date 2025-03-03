import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';
import 'package:side_bizbooster/vendor/views/vendor_details_screen.dart';

class VendorListViewScreen extends StatefulWidget {
  const VendorListViewScreen({super.key});

  @override
  State<VendorListViewScreen> createState() => _VendorListViewScreenState();
}
final List<dynamic> imageData=[
  'assets/vendor/img/circ_avtr_1.png',
  'assets/vendor/img/circ_avtr_2.png',
  'assets/vendor/img/circ_avtr_3.png',
  'assets/vendor/img/circ_avtr_4.png',
  'assets/vendor/img/circ_avtr_5.png',
];
final String address='3rd Floor, C307, Amanora Chamber, Mall';
bool isServiceAvailable=true;
class _VendorListViewScreenState extends State<VendorListViewScreen> {
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: CupertinoNavigationBar(
        middle: Text('Vendor',style: TextStyle(fontSize: 16,color: Color.fromRGBO(0, 80, 157, 1)),),
      ),
      body: ListView.builder(
            physics: ScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.04),
            shrinkWrap: true,
              itemCount:imageData.length,
              itemBuilder: (context,index){
            return customContainer(
              onTap: (){
                Get.to(()=>VendorDetailsScreen(serviceTitle: 'Service Provider ${index + 1}',isAvailable:isServiceAvailable,address: address,imagePath: imageData[index],));
              },
              borderColor: Colors.grey.shade300,
              vMargin: height*0.005,
              shadowColor: Colors.blue.shade50,
              bRadius: width*0.04,vPadding: height*0.01,
              hPadding: width*0.02,
              child: Row(
                children: [
                  ///Ratings and Circle Avatar
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(CupertinoIcons.heart,color: Colors.grey,size: width*0.06,),
                        CircleAvatar(radius: width*0.12,backgroundImage: AssetImage(imageData[index]),),
                        _iconTextRow(text: '4.5', icon: Icons.star, size: width*0.05,iconColor: Color.fromRGBO(0, 80,157,1),textColor: Color.fromRGBO(0, 80, 157, 1)),
                        SizedBox(height: height*0.01,),
                      ],
                    ),
                  SizedBox(width: width*0.02,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Service Provider ${index + 1}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                        Text(address,style: TextStyle(color: Colors.grey,fontSize: 14),),
                        _iconTextRow(text: 'Pune', icon: CupertinoIcons.map_pin,size:width*0.05,iconColor: Colors.red ),
                        _iconTextRow(text: '2.8 KM Away', icon:Icons.map_outlined,size:width*0.05,iconColor: Colors.green),
                        _availability(width: width,isAvailable: index==4?false:isServiceAvailable),
                      ],
                    ),
                  ),
                ],
              ),
            );
         }
      ),
    );
  }
}
Widget _iconTextRow({required String text,required IconData icon,required double size,Color? iconColor,Color? textColor}){
  return Row(
    children: [
      Icon(icon,size:size,color: iconColor??Colors.black,),
      SizedBox(width: size*0.2,),
      Text(text,style:TextStyle(fontSize: 14,color:textColor?? Colors.grey,fontWeight: FontWeight.w500) ,),
    ],
  );
}

Widget _availability({required double width,required bool isAvailable}){
  return customContainer(bRadius: width*0.04,
    borderColor: isAvailable?Colors.green:Colors.red,
    width: isAvailable?width*0.29:width*0.35,
    hPadding: width*0.01,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.circle,color: isAvailable? Colors.green:Colors.red,),
        Text(isAvailable?'Available':'Unavailable',style: TextStyle(fontSize: 14,color:isAvailable?Colors.green:Colors.red,fontWeight: FontWeight.w500),),
      ],
    ),
  );
}