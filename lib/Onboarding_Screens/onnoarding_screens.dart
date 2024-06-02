
import 'package:dog_assignment/Onboarding_Screens/pageone.dart';
import 'package:dog_assignment/Onboarding_Screens/pagethree.dart';
import 'package:dog_assignment/Onboarding_Screens/pagetwo.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<OnBoardNotifier>(builder: (context, onBoardNotifier, child) {
        return Stack(
          children: [
            PageView(
              physics: onBoardNotifier.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (page) {
                onBoardNotifier.isLastPage = page == 2;
              },
              children: const [
                Pageone(),
                Pagetwo(),
                Pagethree(),
              ],
            ),

            //PAGE TRANSITION INDICATOR
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.19,
              left: 0,
              right: 0,
              child: onBoardNotifier.isLastPage
                  ? const SizedBox.shrink()
                  : Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                            dotHeight: 12,
                            dotWidth: 12,
                            spacing: 10,
                            dotColor: Color(0xFFF9C2BA),
                            activeDotColor: Colors.pink),
                      ),
                    ),
            ),
            //OPTIO FOR SKIP INTRO
            Positioned(
                child: onBoardNotifier.isLastPage 
                ? const SizedBox.shrink() : Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(2);
                      },
                      child:Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFEA4A6A)
                        )
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEA4A6A)
                        )
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        );
      }),
    );
  }
}



class OnBoardNotifier extends ChangeNotifier {
  
  bool _isLastPage = false;

  bool get isLastPage => _isLastPage;

  set isLastPage (bool lastpage) {
    _isLastPage = lastpage;
    notifyListeners();
  }
}
