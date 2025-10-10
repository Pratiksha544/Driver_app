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
      Container(height: 160,),
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.white,),
          height: 355,
          width: 350,
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
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blue),
                        ),
                        Text('New York, USA', style: TextStyle(color: Colors.grey,fontSize: 10)),
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
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Delivery',style: TextStyle(fontSize: 15),),
                    )
                    
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
                        color: Colors.blue,border: Border.all(color: Colors.grey)),
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('PickUP',style: TextStyle(fontSize: 15),),
                    )
                    
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),
                        color: Colors.blue,border: Border.all(color: Colors.grey) ),
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Normal',style: TextStyle(fontSize: 15),),
                    )
                    
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8) ),border: Border.all(
                      color: Colors.grey
                    )),
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('ASAP',style: TextStyle(fontSize: 15),),
                    )
                    
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const DashedContainer(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Center(
                      child: Text('Line Deliveries to Pickup', style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Table(
                  border: TableBorder.all(color: Colors.blue.withOpacity(0.2)),
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Icon(Icons.lock),
                              SizedBox(width: 8),
                              Text('Notes'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Icon(Icons.inventory),
                              SizedBox(width: 8),
                              Text('Parcel Details'),
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
                            children: const [
                              Icon(Icons.person),
                              SizedBox(width: 8),
                              Text('Customer details'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Icon(Icons.access_time),
                              SizedBox(width: 8),
                              Text('Time Slot'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('* Tap on the tabs to add more details', style: TextStyle(color: Colors.grey)),
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
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}