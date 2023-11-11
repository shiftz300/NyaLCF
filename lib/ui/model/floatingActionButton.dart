import 'package:flutter/material.dart';

import 'ToolDialog.dart';

class FloatingActionButtonX {
  Builder button() {
    return Builder(builder: (BuildContext context) {
      return FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pink[100],
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return ToolDialog(context: context).build();
            }),
        elevation: 7.0,
        highlightElevation: 14.0,
        mini: false,
        shape: const CircleBorder(),
        isExtended: false,
        child: const Icon(Icons.add),
      );
    });
  }
}
