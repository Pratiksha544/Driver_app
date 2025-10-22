import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'referral.dart'; // Import the referral.dart file

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History & Support',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color(0xFF1C2526),
      ),
      body: Container(
        color: const Color(0xFF1C2526),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Feel free to reach us all queries related product\nSubscription & Technical support',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2F32),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildSupportButton(
                              'WhatsApp',
                              AntDesign.whats_app_outline,
                              onTap: _openWhatsApp,
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 120,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: _buildSupportButton(
                              'Call us',
                              Icons.phone,
                              onTap: _callUs,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildSupportButton(
                              'Chat with us',
                              Icons.chat,
                              onTap: _chatWithUs,
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 120,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: _buildSupportButton(
                              'Write to us',
                              Icons.email,
                              onTap: _writeToUs,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Let\'s earn with Zeo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Refer & Earn Upto ₹1500 Per referral\nby referring your friends.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Share referral invite using',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButtonf(EvaIcons.facebook),
                    const Spacer(),
                    _buildSocialButtont(AntDesign.twitter_outline),
                    const Spacer(),
                    _buildSocialButtonl(EvaIcons.linkedin),
                    const Spacer(),
                    _buildSocialButtonw(AntDesign.whats_app_outline),
                    const Spacer(),
                    _buildShareButton(context),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Referral()),
                    );
                  },
                  child: const Center(
                    child: Text(
                      'How it Works?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSupportButton(String text, IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue, size: 40),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _openWhatsApp() async {
    const phoneNumber = '919999999999'; // Your number
    const message = 'Hello, I need support';
    final url = Uri.parse('https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch WhatsApp');
    }
  }

  void _callUs() async {
    const phoneNumber = 'tel:+919999999999';
    final url = Uri.parse(phoneNumber);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  void _chatWithUs() async {
    const phoneNumber = 'sms:+919999999999';
    final url = Uri.parse(phoneNumber);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  void _writeToUs() async {
    const email = 'support@example.com'; // 🔹 Replace with your support email
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull('subject=Support Request&body=Hello, I need support regarding...'),
    );

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(
          emailLaunchUri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        // fallback for some Android devices
        final Uri gmailFallback = Uri.parse(
            'https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=Support%20Request&body=Hello%2C%20I%20need%20support%20regarding...');
        if (await canLaunchUrl(gmailFallback)) {
          await launchUrl(gmailFallback, mode: LaunchMode.externalApplication);
        } else {
          print('Could not launch any email app');
        }
      }
    } catch (e) {
      print('Error launching email app: $e');
    }
  }

  // Social buttons
  Widget _buildSocialButtonf(IconData icon) {
    return GestureDetector(
      onTap: () async {
        const appLink = 'https://play.google.com/store/apps/details?id=com.example.yourapp';
        final url = Uri.parse('https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(appLink)}');
        if (await canLaunchUrl(url)) await launchUrl(url, mode: LaunchMode.externalApplication);
      },
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        maxRadius: 25,
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildSocialButtont(IconData icon) {
    return GestureDetector(
      onTap: () async {
        const appLink = 'https://play.google.com/store/apps/details?id=com.example.yourapp';
        final url = Uri.parse('https://twitter.com/intent/tweet?text=Check out this app&url=${Uri.encodeComponent(appLink)}');
        if (await canLaunchUrl(url)) await launchUrl(url, mode: LaunchMode.externalApplication);
      },
      child: CircleAvatar(
        child: Icon(icon, color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 7, 103, 187),
        maxRadius: 25,
      ),
    );
  }

  Widget _buildSocialButtonl(IconData icon) {
    return GestureDetector(
      onTap: () async {
        const appLink = 'https://play.google.com/store/apps/details?id=com.example.yourapp';
        final url = Uri.parse('https://www.linkedin.com/sharing/share-offsite/?url=${Uri.encodeComponent(appLink)}');
        if (await canLaunchUrl(url)) await launchUrl(url, mode: LaunchMode.externalApplication);
      },
      child: CircleAvatar(
        child: Icon(icon, color: Colors.white, size: 25),
        backgroundColor: Colors.blue,
        maxRadius: 25,
      ),
    );
  }

  Widget _buildSocialButtonw(IconData icon) {
    return GestureDetector(
      onTap: () async {
        const appLink = 'https://play.google.com/store/apps/details?id=com.example.yourapp';
        final url = Uri.parse('https://wa.me/?text=${Uri.encodeComponent("Check out this app: $appLink")}');
        if (await canLaunchUrl(url)) await launchUrl(url, mode: LaunchMode.externalApplication);
      },
      child: CircleAvatar(
        backgroundColor: Colors.green,
        maxRadius: 25,
        child: Icon(icon, color: Colors.white, size: 25),
      ),
    );
  }

  Widget _buildShareButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        const appLink = 'https://play.google.com/store/apps/details?id=com.example.yourapp';
        Share.share('Check out this app: $appLink');
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.share, color: Colors.white, size: 20),
            SizedBox(width: 5),
            Text(
              'Share',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}