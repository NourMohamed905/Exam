import 'package:flutter/material.dart';

class PlaceHolderWidget extends StatelessWidget {
  final String screenName;
  const PlaceHolderWidget({super.key, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screenName)),
      body: Center(child: Text('$screenName is not implemented yet')),
    );
  }
}
