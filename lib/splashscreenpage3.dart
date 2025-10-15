import 'package:flutter/material.dart';
import 'painters.dart'; // Import DashedContainer

Widget buildPage3({
  required Widget Function({
    Widget? child,
    double? width,
    double? height,
    EdgeInsets? margin,
    double borderRadius,
  }) buildRoundedContainer,
}) {
  return Column(
    children: [
      Container(height: 200,),
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.white,),
          height: 315,
          width: 330,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Central park',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.blue),
                        ),
                        Text('New York, USA', style: TextStyle(color: Color.fromARGB(255, 118, 118, 118),fontSize: 10)),
                      ],
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8) ),border: Border.all(
                      color: Colors.grey
                    ) ),
                    width: 72,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(' Delivery',style: TextStyle(fontSize: 12,color: const Color.fromARGB(255, 69, 69, 69),),),
                    )
                    
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
                        color: Color.fromARGB(255, 36, 110, 221),border: Border.all(color: Colors.grey)),
                    width: 72,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(' Pickup',style: TextStyle(fontSize: 12,color: Colors.white,),),
                    )
                    
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),
                        color: Color.fromARGB(255, 36, 110, 221),border: Border.all(color: Colors.grey) ),
                    width: 72,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(' Normal',style: TextStyle(fontSize: 12,color: Colors.white,),),
                    )
                    
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8) ),border: Border.all(
                      color: Colors.grey
                    )),
                    width: 72,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('  ASAP',style: TextStyle(fontSize: 12,color: const Color.fromARGB(255, 69, 69, 69),),),
                    )
                    
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                Container(
                  width: 300,
                color: const Color.fromARGB(255, 223, 245, 255), // Background color
                child: DashedContainer(
                dashedBorder: const DashedBorder(
                color: Colors.blue,
                dashLength: 10,
                gapLength: 5,
              ),
    
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Center(
                  child: Text('Line Deliveries to Pickup', style: TextStyle(color: Colors.blue,fontSize: 12,)),
                ),
              ),
            ),
          ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  width: 300,
                  child: Table(
                    border: TableBorder.all(
                      borderRadius: BorderRadius.circular(10),
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.4)),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.lock,size: 16,color: Colors.blue,),
                                SizedBox(width: 4),
                                Text('Notes', style: TextStyle(fontSize: 12,color: Colors.blue)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.inventory,size: 16,color: Colors.blue,),
                                SizedBox(width: 4),
                                Text('Parcel Details',style: TextStyle(fontSize: 12,color: Colors.blue,)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.person,size: 16,color: Colors.blue,),
                                SizedBox(width: 4),
                                Text('Customer details',style: TextStyle(fontSize: 12,color: Colors.blue,)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.access_time,size: 16,color: Colors.blue,),
                                SizedBox(width: 4),
                                Text('Time Slot',style: TextStyle(fontSize: 12,color: Colors.blue,)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                const Text('* Tap on the tabs to add more details', style: TextStyle(color: Colors.grey,fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(25.0),
        child: Text(
          'Make deliveries, Pickups &\nPickup linked deliveries',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

class DashedBorder {
  final Color color;
  final double dashLength;
  final double gapLength;
  final double thickness;


  const DashedBorder({
    this.color = Colors.black,      // Default border color
    this.dashLength = 10.0,         // Default dash length
    this.gapLength = 5.0,          // Default gap length
    this.thickness = 1.0,  
            // Default border thickness
  });

  // Optional: Method to create a Border object (if needed for Container decoration)
  Border toBorder() {
    return Border(
      left: BorderSide(color: color, width: thickness),
      top: BorderSide(color: color, width: thickness),
      right: BorderSide(color: color, width: thickness),
      bottom: BorderSide(color: color, width: thickness),
    );

  }
}