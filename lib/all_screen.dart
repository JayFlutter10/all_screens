import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  final List<dynamic> name=[
    '/video_academy_main',
    '/favourite_view_screen',
    '/package_view_screen',
    '/selected_package_screen',
    '/rewards_view',
    '/navigate_to_shorts',
    '/terms_conditions',
    '/color_test_view',
    '/chart',
    '/submit_details_screen',
  ];
  final List<String> nameOfPages=[
    'Video Academy','Favourite Screen','Package Screen','Bought Package Screen','Reward Screen','Shorts Screen','Terms and Conditions 5X','Color Theme','Chart 5X','Cart'
  ];
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                 itemCount: name.length,
                 shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 itemBuilder: (context,index){
                return customContainer(bRadius: width*0.5,containerColor: Colors.blue.shade800,onTap: (){
                Navigator.pushNamed(context, name[index].toString());
                }
                ,child: Center(child: Text(nameOfPages[index].toString(),style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,softWrap: true,maxLines: 2,),),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
