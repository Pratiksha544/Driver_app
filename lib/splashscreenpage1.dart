import 'package:flutter/material.dart';

Widget buildPage1({
  required Widget Function({
    Widget? child,
    double? width,
    double? height,
    EdgeInsets? margin,
    double borderRadius,
  }) buildRoundedContainer,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: buildRoundedContainer(
          height: 60,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: CircleAvatar(child: Icon(Icons.search, color: Colors.blue)),
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 130),
                    child: Text(
                      'Search stops',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'search by address and add stops to\nyour routes',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: buildRoundedContainer(
          height: 60,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: CircleAvatar(child: Icon(Icons.insert_drive_file, color: Colors.blue)),
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 120.0),
                    child: Text(
                      'Import Excel',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'import your stops as a convenient\nexcel it as a photo',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: buildRoundedContainer(
          height: 60,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: CircleAvatar(child: Icon(Icons.image, color: Colors.blue)),
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 120.0),
                    child: Text(
                      'Image Upload',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'upload your stops as an image or\ncapture it as a photo',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: buildRoundedContainer(
          height: 60,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  child: Icon(Icons.qr_code, color: Colors.blue),
                  minRadius: 20,
                ),
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 110.0),
                    child: Text(
                      'Scan Barcode',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Add stops by simply scanning the\nbarcode of your stops',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'Add & Import the stops as\nthe way you like',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 30),
    ],
  );
}