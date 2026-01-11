import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  late var height = MediaQuery.of(context).size.height;
  late var width = MediaQuery.of(context).size.width;

  List<String> imagePath = [
    Appassets.onboarding1,
    Appassets.onboarding2,
    Appassets.onboarding3,
    Appassets.onboarding4,
  ];

  List<String> title = [
    "Personalize Your Experience",
    "Find Events That Inspire You",
    "Effortless Event Planning",
    "Connect with Friends & Share Moments",
  ];

  List<String> content = [
    "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
    "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: height * 0.06,
                width: width * 0.40,
                child: Image.asset(Appassets.header_logo),
              ),
              SizedBox(height: height * 0.03),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// image
                        SizedBox(
                          height: height * 0.40,
                          width: width * 0.90,
                          child: Image.asset(imagePath[index]),
                        ),
                        SizedBox(height: height * 0.03),

                        /// text
                        Text(
                          title[index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.primaryColor,
                          ),
                        ),
                        SizedBox(height: height * 0.03),

                        /// text
                        Text(
                          content[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.blackColor,
                          ),
                        ),
                        // SizedBox(height: height * 0.03),
                        Spacer(),
                        (index == 0)
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Language",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Appcolors.primaryColor,
                                        ),
                                      ),
                                      Spacer(),
                                      CircleAvatar(
                                        radius: width * 0.03,
                                        backgroundImage: AssetImage(
                                          Appassets.english_icon,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.04),
                                      CircleAvatar(
                                        radius: width * 0.03,
                                        backgroundImage: AssetImage(
                                          Appassets.arabic_icon,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Row(
                                    children: [
                                      Text(
                                        "Theme",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Appcolors.primaryColor,
                                        ),
                                      ),
                                      Spacer(),
                                      CircleAvatar(
                                        radius: width * 0.03,
                                        backgroundImage: AssetImage(
                                          Appassets.sun_icon,
                                        ),
                                        backgroundColor: Appcolors.primaryColor,
                                      ),
                                      SizedBox(width: width * 0.04),
                                      CircleAvatar(
                                        radius: width * 0.03,
                                        backgroundImage: AssetImage(
                                          Appassets.moon_icon,
                                        ),
                                        backgroundColor: Appcolors.whiteColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.03),
                                  SizedBox(
                                    height: height * 0.07,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Appcolors.primaryColor,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: Text(
                                        "Let’s Start",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  (index == 1)
                                      ? SizedBox(width: width * 0.1)
                                      : IconButton(
                                          onPressed: () {
                                            if (_controller.hasClients) {
                                              _controller.previousPage(
                                                duration: Duration(
                                                  milliseconds: 300,
                                                ),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          },
                                          icon: Icon(Icons.arrow_back),
                                        ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        for (int i = 1; i < 4; i++)
                                          Container(
                                            margin: EdgeInsets.all(
                                              height * 0.002,
                                            ),
                                            width: (i == index) ? 20 : 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: (i == index)
                                                  ? Appcolors.primaryColor
                                                  : Appcolors.blackColor,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (_controller.hasClients) {
                                        _controller.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                    icon: Icon(Icons.arrow_forward),
                                  ),
                                ],
                              ),
                      ],
                    );
                  },
                  itemCount: imagePath.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
