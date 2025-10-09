import 'dart:ui';

import 'package:demo/homescreen.dart';
import 'package:flutter/material.dart';

class DotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.1);
    for (double x = 0; x < size.width; x += 20) {
      for (double y = 0; y < size.height; y += 20) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DashedContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final List<double> dashArray;
  final Radius radius;

  const DashedContainer({
    super.key,
    required this.child,
    this.color = Colors.blue,
    this.strokeWidth = 1.0,
    this.dashArray = const [3, 3],
    this.radius = const Radius.circular(5),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: DashedBorderPainter(
        color: color,
        strokeWidth: strokeWidth,
        dashArray: dashArray,
        radius: radius,
      ),
      child: child,
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final List<double> dashArray;
  final Radius radius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashArray,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), radius));
    final Path dashedPath = _dashPath(path, dashArray);
    canvas.drawPath(dashedPath, paint);
  }

  Path _dashPath(Path source, List<double> dashArray) {
    final Path dashedPath = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      int index = 0;
      while (distance < metric.length) {
        final double length = dashArray[index % dashArray.length];
        if (index % 2 == 0) {
          dashedPath.addPath(
            metric.extractPath(distance, (distance + length).clamp(0.0, metric.length)),
            Offset.zero,
          );
        }
        distance += length;
        index++;
      }
    }
    return dashedPath;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildRoundedContainer({
    Widget? child,
    double? width,
    double? height,
    EdgeInsets? margin = const EdgeInsets.symmetric(horizontal: 40),
    double borderRadius = 5,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }

  Widget _buildOptionRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(text)),
          const Icon(Icons.check, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildBlueButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 40,
      
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Center(child: Text('Mark stop as done', style: TextStyle(color: Colors.white))),
    );
  }

  // ignore: unused_element
  Widget _buildTab(bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildCell() {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const SizedBox(width: 20), // Placeholder for icon
          const Expanded(child: SizedBox()), // Placeholder for text
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: _buildRoundedContainer(
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
                      child: Text('Search stops',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text('search by address and add stops to\nyour routes', style: TextStyle(fontSize: 13),)
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: _buildRoundedContainer(
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
                      child: Text('Import Excel',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text('import your stops as a convenient\nexcel it as a photo', style: TextStyle(fontSize: 13),)
                  ],  
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: _buildRoundedContainer(
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
                      child: Text('Image Upload',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text('upload your stops as an image or\ncapture it as a photo', style: TextStyle(fontSize: 13),)
                  ],
                ),
               
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: _buildRoundedContainer(
            height: 60,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircleAvatar(child: Icon(Icons.qr_code, color: Colors.blue)),
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 110.0),
                      child: Text('Scan Barcode',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text('Add stops by simply scanning the\nbarcode of your stops', style: TextStyle(fontSize: 13),)
          
                  ],
                ),
              ],
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: const Text(
            'Add & Import the stops as the way you like',
            style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30), // Space for text area
      ],
    );
  }

  Widget _buildPage2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRoundedContainer(
          height: 280,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Capture POD', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {},
                  ),
                ],
              ),
              _buildOptionRow('Capture customer signature'),
              _buildOptionRow('Capture Photograph'),
              _buildOptionRow('Delivery note'),
              const SizedBox(height: 16),
              _buildBlueButton(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text('Capture proof of delivery\nvia signature, OTP & Photo',style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
        )// Space for text area
      ],
    );
  }

  Widget _buildPage3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRoundedContainer(
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
                        Text('Central park', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('Pickup', style: TextStyle(color: Colors.white)),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('Normal', style: TextStyle(color: Colors.white)),
                    ),
                    Spacer(),
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
                DashedContainer(
                  child: const Padding(
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
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text('Make deliveries, Pickups & Pickup linked deliveries',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 25, 
            fontWeight: FontWeight.bold
            ),
              textAlign: TextAlign.center,),
        ) ,
            SizedBox(height: 60,)     
      ],
     );
          
  }


  Widget _buildPageIndicators() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: index == _currentPage ? 24 : 8,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBottomContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF121212),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: const Text(
              'Welcome to ZEO',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 9, right: 150),
            child: const Text(
              'Select an option to proceed...',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            icon: const Icon(Icons.g_mobiledata, color: Colors.white, size: 40),
            label: const Text('Continue with Google', style: TextStyle(color: Colors.red)),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              side: const BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: () {},
            // ignore: sort_child_properties_last
            child: const Text('Continue with Email + Password', style: TextStyle(color: Colors.blue)),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.blue),
          CustomPaint(
            painter: DotPainter(),
            size: Size.infinite,
          ),
          PageView(
            controller: _controller,
            children: [
              _buildPage1(),
              _buildPage2(),
              _buildPage3(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPageIndicators(),
                const SizedBox(height: 16), // Added space between indicators and welcome container
                _buildBottomContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}