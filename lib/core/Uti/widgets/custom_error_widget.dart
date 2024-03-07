import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessgae});
  final String errorMessgae;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessgae,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
