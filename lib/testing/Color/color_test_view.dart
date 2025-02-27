import 'package:flutter/material.dart';
import 'package:side_bizbooster/Testing/views/test_color_screen_view.dart';
import 'package:side_bizbooster/constants/colors/app_colors.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class ColorTestView extends StatelessWidget {
  const ColorTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colors for testing'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: AppColors.colorList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
                return customContainer(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TestColorScreenView(color: AppColors.colorList[index]['color'], colorName: AppColors.colorList[index]['name'],)));
                },
                   margin: 5,
                    bRadius: 15,
                  containerColor: AppColors.colorList[index]['color'],
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
