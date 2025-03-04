import 'package:flutter/material.dart';
import 'package:side_bizbooster/custom_widgets/views/animated_circular_progress_indicator_view.dart';
import 'package:side_bizbooster/custom_widgets/views/custom_tap_bar_widget.dart';
import 'package:side_bizbooster/custom_widgets/views/scratcher_view.dart';

import '../../constants/widgets/custom_container.dart';

class CustomWidgetsDefaultView extends StatefulWidget {
  const CustomWidgetsDefaultView({super.key});

  @override
  State<CustomWidgetsDefaultView> createState() => _CustomWidgetsDefaultViewState();
}

class _CustomWidgetsDefaultViewState extends State<CustomWidgetsDefaultView> {
  final List<dynamic> name=[
   '/animated_circular_progress_indicator_view',
   '/custom_tab_bar_widget',
  ];
  final List<String> nameOfPages=[
    'Circular Progress indicator',
    'Tab Bar',

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

              customContainer(bRadius: 50,width: 200,
              vPadding: 10,hPadding: 10,containerColor: Colors.blue,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimatedCircularProgressIndicatorView()));
              },
              child: Text('Circular Progress Indicator',style: TextStyle(color: Colors.white,fontSize: 18),maxLines: 2,)
              ),
              customContainer(bRadius: 50,
                  vPadding: 50,hPadding: 50,containerColor: Colors.blue,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        CustomTapBarWidget(
                          indicatorHeight: 2,
                          tabTitles: ['First','Second','Third','Fourth ','Fifth'],
                          widgets: [
                            _textWidgetTabBar(bRadius: width*0, data: 'data ', height: height*0.5, width: width),
                            _textWidgetTabBar(bRadius: width*0, data: 'Data1', height: height*0.3, width: width),
                            _textWidgetTabBar(bRadius: width*0, data: 'data2', height: height*0.8, width: width),
                            _textWidgetTabBar(bRadius: width*0, data: 'data3', height: height*0.4, width: width),
                            _textWidgetTabBar(bRadius: width*0, data: 'data4', height: height*0.3, width: width),
                            Container(height: height*0.5,)
                          ],
                        )
                      )
                    );
                  },
                  child: Text('Tab Bar',style: TextStyle(color: Colors.white,fontSize: 18),)
              ),
              customContainer(bRadius: 50,width: 200,
                  vPadding: 10,hPadding: 10,containerColor: Colors.blue,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScratcherView()));
                  },
                  child: Text('Circular Progress Indicator',style: TextStyle(color: Colors.white,fontSize: 18),maxLines: 2,)
              ),

             
            ],
          ),
        ),
      ),
    );
  }
}
Widget _textWidgetTabBar({required double bRadius,required String data,Color? color,required double height,required double width}){
  return customContainer(bRadius: bRadius,
    vPadding: 150,
    width: width,
    height: height,
    child: Text(data,style: TextStyle(fontSize: 16),),
    containerColor: color??Colors.blue.shade100,
  );
}