import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class OnBoardingSectionWidget extends StatefulWidget {
  final VoidCallback onFinish;
  const OnBoardingSectionWidget({super.key, required this.onFinish});

  @override
  State<OnBoardingSectionWidget> createState() => _OnBoardingSectionWidgetState();
}

class _OnBoardingSectionWidgetState extends State<OnBoardingSectionWidget> {
  bool isLastPage = false;
  PageController? controller;
  
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/onboarding_1.svg',
      'text': 'Welcome to finance tracker!',
    },
    {
      'image': 'assets/images/onboarding_2.svg',
      'text': 'Are you ready to take control of your finances?',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return PageView.builder(
      controller: controller,
      itemCount: _pages.length,
      onPageChanged: (value) {
        setState(() {
          isLastPage = value == _pages.length - 1;
        });
      },
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Expanded(
                child: Center(
                  child: HeaderWidget(
                    padding: EdgeInsets.fromLTRB(16.0, 100.0, 16.0, 100.0),
                    children: [
                      Text(
                        _pages[index]['text']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(
              height: screenHeight * 0.60,
              child: BodyContainerWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SvgPicture.asset(
                        _pages[index]['image']!,
                        width: 287,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (isLastPage && index == _pages.length - 1) {
                            widget.onFinish();
                          } else {
                            isLastPage = index == _pages.length - 1;
                            controller?.nextPage(
                              duration: Duration(microseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        });
                      },
                      child: Text(
                        isLastPage ? 'Get Started' : 'Next',
                        style: TextStyle(
                          color: AppColors.textOnboarding,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontSize: 30,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SmoothPageIndicator(
                      count: _pages.length,
                      controller: controller!,
                      effect: CustomizableEffect(
                        dotDecoration: DotDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          dotBorder: DotBorder(),
                          height: 14.0,
                          width: 14.0,
                        ),
                        activeDotDecoration: DotDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          color: AppColors.primary,
                          height: 14.0,
                          width: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
