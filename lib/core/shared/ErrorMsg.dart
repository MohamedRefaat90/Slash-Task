import 'package:flutter/material.dart';

class ErrorMsg extends StatelessWidget {
  final String errorMSG;
  const ErrorMsg({super.key, required this.errorMSG});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errorMSG,
      style: const TextStyle(color: Colors.white),
    ));
  }
}
