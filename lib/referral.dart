import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class Referral extends StatelessWidget {
  const Referral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1C2526),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Column(
                  children: [
                    Text(
                      'How\nReferral Works?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildReferralStep(
                  number: '01',
                  title: 'Invite Your Friend',
                  description: 'Invite your friends to Zeo Route Planner',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildReferralStep(
                  number: '02',
                  title: 'Get Free Day Pass',
                  description:
                      'Remind your friend to create his first route with 3 stops, you get a free day pass.',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildReferralStep(
                  number: '03',
                  title: 'Earn Referral Bonus',
                  description:
                      'Remind your friend to subscribe to a plan, he gets 25% discount & you get 50% of his first payment as referral bonus',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildReferralStep(
                  number: '04',
                  title: 'Link Bank Account',
                  description:
                      'Link your bank account, get your referral bonus credited directly to your bank account',
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Refer a friend',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 Added Social Media Buttons (same as in HelpSupportScreen)
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

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReferralStep({
    required String number,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
        children: [
          Container(
            width: 30,
            height: 60, // Increased height to match or exceed text height for centering
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Social buttons (same as HelpSupportScreen)
  Widget _buildSocialButtonf(IconData icon) {
    return GestureDetector(
      onTap: () async {
        const appLink =
            'https://play.google.com/store/apps/details?id=com.example.yourapp';
        final url = Uri.parse(
            'https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(appLink)}');
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
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
        const appLink =
            'https://play.google.com/store/apps/details?id=com.example.yourapp';
        final url = Uri.parse(
            'https://twitter.com/intent/tweet?text=Check out this app&url=${Uri.encodeComponent(appLink)}');
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
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
        const appLink =
            'https://play.google.com/store/apps/details?id=com.example.yourapp';
        final url = Uri.parse(
            'https://www.linkedin.com/sharing/share-offsite/?url=${Uri.encodeComponent(appLink)}');
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
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
        const appLink =
            'https://play.google.com/store/apps/details?id=com.example.yourapp';
        final url = Uri.parse(
            'https://wa.me/?text=${Uri.encodeComponent("Check out this app: $appLink")}');
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
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
        const appLink =
            'https://play.google.com/store/apps/details?id=com.example.yourapp';
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
            Text(
              'Share',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.share, color: Colors.white, size: 20),
            
          ],
        ),
      ),
    );
  }
}
