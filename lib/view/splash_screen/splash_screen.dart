import 'package:flutter/material.dart';
import 'package:provider_task/utils/color_constant/color_constant.dart';
import 'package:provider_task/utils/image_constants/image_constants.dart';
import 'package:provider_task/view/bottom_navigation_bar/bottom_navigation_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstants.splashImage), fit: BoxFit.cover),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.939),
            ),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, left: 25, right: 0, bottom: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      'Define\nyourself in\nyour unique\nway .',
                      style: TextStyle(
                          color: ColorConstant.backgroundColor,
                          fontFamily: "Josefin Sans",
                          fontStyle: FontStyle.italic,
                          height: 1,
                          fontSize: 35,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                          ));
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorConstant.backgroundColor, width: 3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                                color: ColorConstant.backgroundColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: ColorConstant.backgroundColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }
}
