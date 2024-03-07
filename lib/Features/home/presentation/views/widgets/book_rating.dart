import 'dart:math';

import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
         const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          Text(
            '${Random().nextInt(1) + 3}.${Random().nextInt(9)}',
            style: TextStyle(fontSize: 18),
          ),
          Opacity(
            opacity: 0.5,
            child: Text(
              ' (${Random().nextInt(200) + 2000})',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
