import 'package:flutter/material.dart';
import '../../constants/widgets/custom_container.dart';

class VideoAcademy extends StatefulWidget {
  const VideoAcademy({super.key});

  @override
  State<VideoAcademy> createState() => _VideoAcademyState();
}

class _VideoAcademyState extends State<VideoAcademy> {
final List<dynamic> genere=[
  'Certificate','2 Min. Gyan','Live Webinar','Webinar','Training Courses'
];
final List<dynamic> name=[
  '/certificate_view',
  '/two_min_gyan_view',
  '/live_webinar_view',
  '/webinar_view',
  '/training_view',

];
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customContainer(
                containerColor: Colors.blue.shade100,
              margin: 10,
                bRadius: 15,
            height: height*0.2,width: double.infinity
            ),
            GridView.builder(
              shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: genere.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing:2,crossAxisSpacing:0.5), itemBuilder: (context,index){
             return Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 customContainer(
                   containerColor: Colors.blue.shade100,
                     margin: 5,
                     bRadius: 10,height: 150,width: 150,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customContainer(bRadius: 12,height: 110,width: 120,margin: 5,onTap: (){
                         Navigator.pushNamed(context, name[index].toString());
                        },),
                        Text(genere[index].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                      ],
                    ),
                 ),
               ],
             );
            })
          ],
        ),
      ),
    );
  }
}
