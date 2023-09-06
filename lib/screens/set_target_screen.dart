import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:walkmate/provider/darkModeProvider.dart';

import '../utils/const.dart';

class SetTargetPage extends StatelessWidget {
  const SetTargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
      builder: (context, darkProvider, chlid) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "WalkMate",
                style: GoogleFonts.roboto(),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: InkWell(
                  onTap: () {
                    darkProvider.setMode(!darkProvider.isModeDark);
                  },
                  child: Icon(
                    darkProvider.isModeDark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    size: 25,
                    // color: kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .3,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        "Set your walking goal now!",
                        // style: darkProvider.isModeDark
                        //     ? kFontSizeBigStyle
                        //     : kFontSizeBigStyle.copyWith(
                        //         // color: kPrimaryColor,
                        //         ),
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: kFontSizeBigStyle),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        "Your determination and effort is\ninspiring. Keep pushing yourself to reach new heights.",
                        style: GoogleFonts.manrope(
                          textStyle: const TextStyle(),
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Add Your Target".toUpperCase(),
                style: darkProvider.isModeDark
                    ? GoogleFonts.manrope(textStyle: kFontCapitalStyle)
                    : GoogleFonts.manrope(
                        textStyle: kFontCapitalStyle,
                        color: kPrimaryColor,
                      ),
              ),
              // SfSlider(
              //   enableTooltip: true,
              //   shouldAlwaysShowTooltip: true,
              //   value: darkProvider.sliderValue,
              //   interval: 0.2,
              //   min: 0,
              //   max: 10000,
              //   thumbIcon: Image.asset("assets/images/Slider.png"),
              //   showDividers: true,
              //   dividerShape: const SfDividerShape(),
              //   onChanged: (val) {
              //     darkProvider.getSliderValue(val);
              //   },
              // ),

              SliderTheme(
                data: const SliderThemeData(),
                child: Slider(
                  divisions: 10,
                  thumbColor: kPrimaryColor,
                  activeColor: kPrimaryColor,
                  inactiveColor: Colors.black38,
                  // mouseCursor: MaterialStateMouseCursor.textable,
                  label: (darkProvider.sliderValue).toInt().toString(),
                  value: darkProvider.sliderValue / 1000,
                  onChanged: (val) {
                    darkProvider.getSliderValue(val * 1000);
                  },
                ),
              ),
              Text(
                (darkProvider.sliderValue).toInt().toString(),
                style: kFontCapitalStyle.copyWith(
                  color: kPrimaryColor,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .15),
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      backgroundColor: kPrimaryColor),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SetTargetPage()));
                  },
                  child: const Text(
                    "Set Limit",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: kPrimaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "History",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
