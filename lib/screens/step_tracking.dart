import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/provider/darkModeProvider.dart';
import 'package:walkmate/utils/const.dart';

class StepTracking extends StatelessWidget {
  const StepTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
      builder: (BuildContext context, DarkModeProvider value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: const Text("Step Tracking"),
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
                        "Your Limit Daily is ${(value.sliderValue).toInt()} Step",
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
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Enter Your Today's record".toUpperCase(),
                style: kFontCapitalStyle.copyWith(
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 340,
                height: 70,
                // color: kPrimaryColor,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  showCursor: false,
                  decoration: InputDecoration(
                    hintText: "How many step you walked today?",
                    label: Text(
                      "Enter your step",
                      style: TextStyle(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
