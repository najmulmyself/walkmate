import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                        style: darkProvider.isModeDark
                            ? kFontSizeBigStyle
                            : kFontSizeBigStyle.copyWith(
                                // color: kPrimaryColor,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Text(
                        "Your determination and effort is\ninspiring. Keep pushing yourself to reach new heights.",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(),
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
