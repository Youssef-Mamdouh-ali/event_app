import 'package:event_app/core/routes/pages_routes_name.dart';
import 'package:event_app/core/widgets/customElevatedButton.dart';
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
              /// header image
              SizedBox(
                height: height * 0.04,
                width: width * 0.40,
                child: Image.asset(
                  Appassets.logo,
                  color: Appcolors.primaryColor,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
              SizedBox(height: height * 0.03),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
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
                              color: Appcolors.textMainColor,
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          /// text details
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    content[index],

                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Appcolors.textSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                           ///   mode and language
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                   if(index==0) Column(children: [
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
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Appcolors.primaryColor,
                                              borderRadius: BorderRadius.circular(
                                                12,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                                vertical: 6.0,
                                              ),
                                              child: Text(
                                                "English",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: width * 0.01),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Appcolors.whiteColor,
                                              borderRadius: BorderRadius.circular(
                                                12,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                                vertical: 6.0,
                                              ),
                                              child: Text(
                                                "English",
                                                style: TextStyle(
                                                  color: Appcolors.primaryColor,
                                                ),
                                              ),
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
                                         Container(
                                           height: height * 0.04
                                           ,decoration: BoxDecoration(
                                           color: Appcolors.primaryColor,
                                           borderRadius: BorderRadius.circular(
                                             12,
                                           ),
                                         ),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                               horizontal: 18.0,
                                               vertical: 6.0,
                                             ),
                                             child: Image.asset(Appassets.sun_icon),
                                           ),
                                         ),
                                         SizedBox(width: width * 0.04),
                                         Container(
                                           height: height * 0.04
                                           ,decoration: BoxDecoration(
                                           color: Appcolors.whiteColor,
                                           borderRadius: BorderRadius.circular(
                                             12,
                                           ),
                                         ),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                               horizontal: 18.0,
                                               vertical: 6.0,
                                             ),
                                             child: Image.asset(Appassets.moon_icon),
                                           ),
                                         ),
                                       ],
                                     ),
                                    ],
                                   ),

                                  ],
                                ),
                          SizedBox(height: height * 0.03),
                          /// custom button
                          SizedBox(
                            width: double.infinity
                            ,child: Customelevatedbutton(
                              backgroundColor: Appcolors.primaryColor,
                              buttonName: (index == 0 )? "Let’s start": "Next",
                              onPressed: (){
                                if(index <=2){
                                  if (_controller.hasClients) {
                                    _controller.nextPage(
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.linear,
                                    );
                                  }
                                }else{
                                  Navigator.pushNamed(context,PagesRoutesName.signIn);
                                }

                              },
                            ),
                          )
                        ],
                      ),
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
