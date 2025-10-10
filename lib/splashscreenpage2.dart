import 'package:flutter/material.dart';

Widget buildPage2({
  required Widget Function({
    Widget? child,
    double? width,
    double? height,
    EdgeInsets? margin,
    double borderRadius,
  }) buildRoundedContainer,
  required Widget Function(String text) buildOptionRow,
  required Widget Function() buildBlueButton,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildRoundedContainer(
        height: 260,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Capture POD',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                ),
              ],
            ),
            buildOptionRow('Capture customer signature'),
            buildOptionRow('Capture Photograph'),
            buildOptionRow('Delivery note'),
            const SizedBox(height: 16),
            buildBlueButton(),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25.0),
        child: Text(
          'Capture proof of delivery\nvia signature, OTP & Photo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height: 15,)
    ],
  );
}