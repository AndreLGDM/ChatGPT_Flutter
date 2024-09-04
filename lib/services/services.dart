import 'package:chatgpt_teste/widgets/drop_down.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModal({required BuildContext context}) async {
    await showModalBottomSheet(
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextWidget(
                    label: 'Chosen Model:',
                    fontSize: 16,
                  ),
                ),
                Flexible(flex: 2, child: ModelsDropDownWidget()),
              ],
            ),
          );
        });
  }
}
