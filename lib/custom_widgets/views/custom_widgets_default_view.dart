import 'package:flutter/material.dart';

import '../../constants/widgets/custom_container.dart';

class CustomWidgetsDefaultView extends StatefulWidget {
  const CustomWidgetsDefaultView({super.key});

  @override
  State<CustomWidgetsDefaultView> createState() => _CustomWidgetsDefaultViewState();
}

class _CustomWidgetsDefaultViewState extends State<CustomWidgetsDefaultView> {
  final List<dynamic> name=[
   '/animated_circular_progress_indicator_view',
  ];
  final List<String> nameOfPages=[
    'Custom_widgets',
  ];
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: name.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return customContainer(bRadius: width*0.5,containerColor: Color.fromRGBO(255, 215, 0, 1),onTap: (){
                      Navigator.pushNamed(context, name[index].toString());
                    }
                      ,child: Center(child: Text(nameOfPages[index].toString(),style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,softWrap: true,maxLines: 2,),),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
