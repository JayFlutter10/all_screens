import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class FillLoader extends StatefulWidget {
  const FillLoader({super.key});

  @override
  State<FillLoader> createState() => _FillLoaderState();
}

class _FillLoaderState extends State<FillLoader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customContainer(bRadius: 50,height: 150)
        ],
      ),
    );
  }
}
