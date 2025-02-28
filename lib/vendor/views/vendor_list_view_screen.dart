import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class VendorListViewScreen extends StatelessWidget {
  const VendorListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Vendor',style: TextStyle(fontSize: 16),),
      ),
      body: Column(
        children: [
          customContainer(bRadius: width*0.02,
          ),
        ],
      ),
    );
  }
}
