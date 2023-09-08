import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/provider/dataProvider.dart';
import 'package:walkmate/utils/const.dart';

class StepTracking extends StatefulWidget {
  const StepTracking({super.key});

  @override
  State<StepTracking> createState() => _StepTrackingState();
}

class _StepTrackingState extends State<StepTracking> {
  TextEditingController stepController = TextEditingController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // getStep();
  // }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);

    void getStep() {
      dataProvider.getStep(dataProvider.getDateNow());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Step Tracking"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .35,
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
                      "Your Limit Daily is ${(dataProvider.remainingStep)} Step away ",
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
              child: Consumer<DataProvider>(
                builder: (context, dataProvider, child) => Column(
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
                        keyboardType: TextInputType.number,
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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            backgroundColor: kPrimaryColor),
                        onPressed: () {
                          dataProvider
                              .addData(int.parse(stepController.value.text));
                          stepController.clear();
                          dataProvider.getStep(dataProvider.getDateNow());
                        },
                        child: const Text(
                          "Add Record",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
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
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: dataProvider.getData(dataProvider.getDateNow()),
                      builder: (context, snapshot) {
                        // print(snapshot.connectionState);
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            !snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final data = snapshot.data;

                          if (data!.isEmpty) {
                            return Text(
                                'No data available for ${dataProvider.getDateNow()}');
                          }

                          // Render the data here, e.g., create a ListView or display it in a widget.
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final item = data[index];
                                // dataProvider.calculateStep(item['number']);
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: kPrimaryColor,
                                    child: Text(
                                      '${(item['date']).split('-')[2]}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: Text('Step: ${item['number']}'),
                                  subtitle: Text('Time: ${item['time']}'),
                                  trailing:
                                      Text(dataProvider.totalstep.toString()),
                                );
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // );
  @override
  void dispose() {
    // super.dispose();
    stepController.dispose(); // Dispose of the controller when done.
    // super.dispose();
  }
}
