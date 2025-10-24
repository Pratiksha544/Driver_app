import 'package:flutter/material.dart';

class Manage extends StatelessWidget {
  const Manage({super.key});

  @override
  Widget build(BuildContext context) {
    // A custom color to match the dark background in the images
    const Color darkBackgroundColor = Color(0xFF1A1A2E);
    // Color used for border/accent on non-selected cards (a blue color)
    const Color accentColor = Color(0xFF00AEEF);
    // The specific orange color for the "Best Value" header and accents
    const Color premiumCardOrangeColor = Color(0xFFFF9800); 

    return Scaffold(
      body: Container(
        color: darkBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40), // 🔹 Added top space of 100px

              // Header Row
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                            // Note: fontWeight is not a property of Icon, but bold will be applied
                            // via font if using a Text widget. Icons use fixed weights.
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Upgrade to PRO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Your activated plan is ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 4),
                            ElevatedButton(
                              onPressed: null, // keep disabled for now
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(60, 30)),
                                shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'FREE TIER',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Promotional Box (Top)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: accentColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey, what are you waiting for?',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Get Free Premium Passes Today',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'We offer you 1 week special passes',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: accentColor,
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Deal of the Day
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [accentColor, Color.fromARGB(255, 4, 0, 255)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    // 1. Placeholder Visual (e.g., an Icon or small image area) on the right
                    const Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),

                    // 2. Main Offer Content (Shifted down for the label)
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 32, 100, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get 3 months for INR 1999.0 only!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '62% discount on purchase',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 3. Small Label "Deal Of the day" on top left
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 140, 217, 255),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Deal Of the day',
                          style: TextStyle(
                            color: darkBackgroundColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Free Tier
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: accentColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Free Tier',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      'Free',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),

              // Weekly Pass
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: accentColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Weekly Pass',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'INR',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          ' 400/week',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Monthly Pass
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: accentColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT SIDE CONTENT (Title, Discount message, Effective cost)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row 1: Monthly Pass + 50% OFF Tag
                          Row(
                            children: [
                              const Text(
                                'Monthly Pass',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 8), // Spacing between title and tag
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.orange, // Orange background for the tag
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  '50% OFF',
                                  style: TextStyle(
                                    color: Colors.black, // Dark text on orange background
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8), // Spacing for second line
                          // Text 2: 50% discount on purchase
                          const Text(
                            '50% discount on purchase',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 4), // Spacing for third line (Effective cost)
                          // Text 3: Effective cost of just INR 26.63/Day (Using RichText for multi-styling)
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              children: [
                                const TextSpan(text: 'Effective cost of just '),
                                TextSpan(
                                  text: 'INR 26.63/Day',
                                  style: TextStyle(
                                    color: Colors.orange.shade300,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16), // Space between left content and price

                    // RIGHT SIDE CONTENT (Pricing)
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Current discounted price
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'INR',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              ' 799 ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '/mo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        // Original price (strikethrough)
                        Text(
                          'INR 1600/mo',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // --- New Orange Container (Best Value Subscription) ---
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16), // No vertical margin here to make it touch the card below
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  color: premiumCardOrangeColor, // The bright orange color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Value Subscription',
                      style: TextStyle(
                        color: Colors.black, // Dark text on orange
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Icon(
                      Icons.workspace_premium, // Or Icons.emoji_events, Icons.military_tech
                      color: Colors.black, // Dark icon on orange
                      size: 20,
                    ),
                  ],
                ),
              ),

              // Yearly Pass (UPDATED to match the second image with a dark background)
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 0), // Top margin is 0 to butt up against the orange bar
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: darkBackgroundColor.withOpacity(0.9), // Keeping a dark background for the main card as in image 2
                  border: Border.all(color: premiumCardOrangeColor, width: 2), // Orange border
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT SIDE CONTENT
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row 1: Yearly Pass + 62% OFF Tag
                          Row(
                            children: [
                              const Text(
                                'Yearly Pass',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Tag: 62% OFF
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: premiumCardOrangeColor, 
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  '62% OFF',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Text 2: 62% discount on purchase
                          const Text(
                            '62% discount on purchase',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Text 3: Effective cost...
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 13,
                              ),
                              children: [
                                const TextSpan(text: 'Effective cost of just '),
                                TextSpan(
                                  text: 'INR 21.89/Day', 
                                  style: TextStyle(
                                    color: premiumCardOrangeColor, // Highlighted text color
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Text 4: 7 day free trial included
                          const Text(
                            '7 day free trial included',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    // RIGHT SIDE CONTENT (Pricing)
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Current discounted price
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'INR',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              ' 7990 ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '/yr',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        // Original price (strikethrough)
                        Text(
                          'INR 20800/yr',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Terms
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Terms & Conditions',
                  style: TextStyle(color: Colors.blue, fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue, 
                  decorationThickness: 1.5, ),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}