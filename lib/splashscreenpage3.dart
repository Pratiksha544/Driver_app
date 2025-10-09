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
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildRoundedContainer(
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
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('New York, USA', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Delivery', style: TextStyle(color: Colors.white)),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Pickup', style: TextStyle(color: Colors.white)),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Normal', style: TextStyle(color: Colors.white)),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('ASAP', style: TextStyle(color: Colors.white)),
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
      const Padding(
        padding: EdgeInsets.all(25.0),
        child: Text(
          'Make deliveries, Pickups & Pickup linked deliveries',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 60),
    ],
  );
}