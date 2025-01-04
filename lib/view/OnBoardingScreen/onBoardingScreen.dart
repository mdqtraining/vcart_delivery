import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Go_Router/routeDefination.dart';
import '../../Model/onboardingScreen_model/onboarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  final assest_ = onBoardingAssests.assetOfOnBoarding();
  bool isNextClicked = false;
  bool isSkipClicked = false;
  Color clickedColor = Colors.red;
  int _pageIndicator = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool _isSkiped = false;
  bool _isNext = false;

  void Skipped(value){
    setState(() {
      _isSkiped = value;
    });
  }

  void Next(value){
    setState(() {
      _isNext =value;
    });
  }

  void pageIndicator(index){
    setState( () {
      _pageIndicator = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: Column(
              children: [Expanded(
                child: PageView.builder(
                    onPageChanged: (index){
                      pageIndicator(index);
                       },
                    itemCount: assest_.length ?? 0,
                    controller: _pageController,
                    itemBuilder: (context, index) =>
                        onboardingContent(
                          animation: assest_[index].animation,
                          Headline: assest_[index].Headline,
                          slogan: assest_[index].slogan,)),
              ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, bottom: 24),
                  child: Row(
                    children: [

                      //container button to skip the onboarding
                      Container(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(onPressed: () async {

                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('hasViewedOnboarding', true);
                          Skipped(true);

                      await Future.delayed(Duration(seconds: 1));
                          if(mounted) {
                            context.go(pageRoute.Login_input);
                      }
                      //throw Exception();
                        },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: isSkipClicked ? Colors.white : Color(0xFFFF5963),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side: isSkipClicked ? BorderSide(color: Color(0xFFFF5963)) : BorderSide.none
                                )
                            ),
                            child: Text("Skip",
                              style: GoogleFonts.inter(
                                fontSize: 18, // WidthSize*0.05,
                                color: isSkipClicked ? Color(0xFFFF5963) : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                        ),
                      ),

                      Spacer(),
                      ...List.generate(assest_.length, (index) =>
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: DotedIndicator(isActive: index == _pageIndicator),
                          ),
                      ),

                      Spacer(),

                      Container(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('hasViewedOnboarding', true);
                          Next(true);

                          await Future.delayed(Duration(milliseconds: 500));

                          Next(false);

                      _pageController.nextPage(duration: Duration(
                              microseconds: 300),
                              curve: Curves.ease);

                          if(_pageIndicator == 2){
                            if(mounted){
                          context.pushReplacement(pageRoute.Login_input);
                        }
                      }
                        },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: isNextClicked ? Colors.white : Color(0xFFFF5963),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side: isNextClicked ? BorderSide(color: Color(0xFFFF5963)) : BorderSide.none
                                )
                            ),
                            child: Text("Next",
                              style: GoogleFonts.inter(
                                fontSize: 18, // WidthSize*0.05,
                                color: isNextClicked ? Color(0xFFFF5963) : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),)
                        ),
                      ),
                    ],
                  ),
                )
              ]
          )
      ),
    );
  }
}

class DotedIndicator extends StatefulWidget {

  DotedIndicator({super.key,this.isActive = false});

  bool isActive;

  @override
  State<DotedIndicator> createState() => _DotedIndicatorState();
}

class _DotedIndicatorState extends State<DotedIndicator> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isActive ? 9 : 4,
      width: widget.isActive? 6 : 4 ,
      decoration: BoxDecoration(
          color: widget.isActive? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}

//View of Onboarding Screen
class onboardingContent extends StatelessWidget {

  LottieBuilder animation;
  String Headline;
  String slogan;

  onboardingContent({
    super.key,
    required this.animation,
    required this.Headline,
    required this.slogan,});

  @override
  Widget build(BuildContext context) {

    return SafeArea(child:
    Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.15,),

        animation,  //Lottie Animation file

        SizedBox(height: MediaQuery.of(context).size.height * 0.045,),

        Text(Headline,
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontSize: 32,
          ),),

        SizedBox(height: MediaQuery.of(context).size.height * 0.045),

        Text(slogan,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    ));
  }
}
