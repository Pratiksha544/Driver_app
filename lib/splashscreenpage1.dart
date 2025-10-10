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
        padding: const EdgeInsets.only(right: 50.0),
        child: buildRoundedContainer(
          height: 70,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(child: Icon(Icons.search, color: Colors.blue),minRadius: 18,),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 70,top: 6),
                    child: Text(
                      'Search stops',
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.0),
                    child: Text(
                      'search by address and add\nstops to your routes',
                      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),
                      textAlign: TextAlign.start,                    
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: buildRoundedContainer(
          height: 70,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(child: Icon(Icons.insert_drive_file, color: Colors.blue),minRadius: 18,),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 90.0,top: 6),
                    child: Text(
                      'Import Excel',
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),
                    ),
                  ),
                  Text(
                    'import your stops as a\nconvenient excel it as a photo',
                    style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: buildRoundedContainer(
          height: 70,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(child: Icon(Icons.image, color: Colors.blue),minRadius: 18,),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 85.0,top: 5),
                    child: Text(
                      'Image Upload',
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),
                    ),
                  ),
                  Text(
                    'upload your stops as an image\nor capture it as a photo',
                    style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: buildRoundedContainer(
          height: 70,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  child: Icon(Icons.qr_code, color: Colors.blue),
                  minRadius: 18,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 80.0,top: 5),
                    child: Text(
                      'Scan Barcode',
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),
                    ),
                  ),
                  Text(
                    'Add stops by simply scanning\nthe barcode of your stops',
                    style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),
                    textAlign: TextAlign.start,
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
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 70),
    ],
  );
}