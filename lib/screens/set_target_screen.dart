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
                style: GoogleFonts.manrope(textStyle: kFontCapitalStyle),
              ),
              SfSlider(
                enableTooltip: true,
                shouldAlwaysShowTooltip: true,
                value: darkProvider.sliderValue,
                interval: 0.2,
                min: 0,
                max: 10000,
                thumbIcon: Image.asset("assets/images/Slider.png"),
                showDividers: true,
                dividerShape: const SfDividerShape(),
                onChanged: (val) {
                  darkProvider.getSliderValue(val);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
