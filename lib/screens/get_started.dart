import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/provider/darkModeProvider.dart';
import 'package:walkmate/utils/const.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
      builder: (context, darkProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "WalkMate",
                style: GoogleFonts.roboto(textStyle: kFontSizeMidStyle),
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
                    color: kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Hello")),
              Center(
                child:
                    Text("is Dark : ${darkProvider.darkThemePrefs.getTheme()}"),
              ),
            ],
          ),
        );
      },
    );
  }
}
