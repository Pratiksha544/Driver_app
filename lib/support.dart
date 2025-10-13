import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C2526),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                        Expanded(child: _buildSupportButton('WhatsApp', AntDesign.whats_app_outline)),
                        Container(
                          width: 2,
                          height: 140,
                          color: Colors.grey,
                        ),
                        Expanded(child: _buildSupportButton('Call us', Icons.phone)),
                      ],
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildSupportButton('Chat with us', Icons.chat)),
                        Container(
                          width: 2,
                          height: 140,
                          color: Colors.grey,
                        ),
                        Expanded(child: _buildSupportButton('Write to us', Icons.email)),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: const Text(
                  'Let\'s earn with Zeo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: const Text(
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
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: const Text(
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
                  Spacer(),
                  _buildSocialButtont(AntDesign.twitter_outline),
                  Spacer(),
                  _buildSocialButtonl(EvaIcons.linkedin),
                  Spacer(),
                  _buildSocialButtonw(AntDesign.whats_app_outline),
                  Spacer(),
                  _buildShareButton(),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: const Text(
                  'How it Works?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSupportButton(String text, IconData icon) {
    return Column(
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
    );
  }

  Widget _buildSocialButtonf(IconData icon) {
    return CircleAvatar(child: Icon(icon, color: Colors.white, size: 30), backgroundColor: Colors.blue, maxRadius: 25,);
  }

  Widget _buildSocialButtont(IconData icon) {
    // ignore: sort_child_properties_last
    return CircleAvatar(child: Icon(icon, color: Colors.white, size: 30), backgroundColor: const Color.fromARGB(255, 7, 103, 187), maxRadius: 25,);
  }

  Widget _buildSocialButtonl(IconData icon) {
    // ignore: sort_child_properties_last
    return CircleAvatar(child: Icon(icon, color: Colors.white, size: 25), backgroundColor: Colors.blue, maxRadius: 25,);
  }

  Widget _buildSocialButtonw(IconData icon) {
    return CircleAvatar(child: Icon(icon, color: Colors.white, size: 25), backgroundColor: Colors.green, maxRadius: 25,);
  }

  Widget _buildShareButton() {
    return Container(
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
    );
  }
}