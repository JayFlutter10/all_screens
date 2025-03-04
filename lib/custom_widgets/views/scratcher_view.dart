import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:scratcher/widgets.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class ScratcherView extends StatefulWidget {
  const ScratcherView({super.key});

  @override
  State<ScratcherView> createState() => _ScratcherViewState();
}

class _ScratcherViewState extends State<ScratcherView> {
  String get number => randomNumeric(10);


  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: customContainer(
              width: width*0.8,height: height*0.5,
              containerColor: Colors.grey,
              bRadius: width*0.04,
              child: Scratcher(
                onChange: (_){
                  String number=randomNumeric(5);
                },
                image: Image.asset('assets/scratch/img/gray.png'),
                color: Color.fromRGBO(0, 80, 157, 1),
                  brushSize: 100,
                  child: Center(
                child: Text(number)
              )),
            ),
          )
        ]
      ),
    );
  }
}
