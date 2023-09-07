import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/provider/darkModeProvider.dart';
import 'package:walkmate/provider/dataProvider.dart';
import 'package:walkmate/utils/const.dart';

class StepTracking extends StatelessWidget {
  StepTracking({super.key});
  TextEditingController stepController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
      builder: (BuildContext context, DarkModeProvider value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: const Text("Step Tracking"),
          ),
          body: SingleChildScrollView(
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        "Enter Your Today's record".toUpperCase(),
                        style: kFontCapitalStyle.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 390,
                        height: 70,
                        // color: kPrimaryColor,
                        child: TextField(
                          controller: stepController,
                          cursorColor: kPrimaryColor,
                          // keyboardType: TextInputType.number,
                          showCursor: true,
                          decoration: const InputDecoration(
                            hintText: "How many step you walked today?",
                            label: Text(
                              "Enter your step",
                              style: TextStyle(color: Colors.white),
                            ),
                            focusColor: kPrimaryColor,
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: Consumer<DataProvider>(
                            builder: (context, dataProvider, chlid) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                backgroundColor: kPrimaryColor),
                            onPressed: () {
                              // dataProvider
                              //     .addData(stepController.value.text as int);
                            },
                            child: const Text(
                              "Add Record",
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your record : ",
                          style: kFontCapitalStyle.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
