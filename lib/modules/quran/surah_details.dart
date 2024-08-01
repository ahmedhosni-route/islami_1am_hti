import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_1pm/modules/layout/widgets/surah_name_widget.dart';

import '../../core/widgets/custom_bg.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = "SurahDetails";
  SurahDetails({super.key});

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  String surah = "";
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    SurahData data = ModalRoute.of(context)!.settings.arguments as SurahData;
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    if (surah == "") {
      readFile(data.index);
    }
    return CustomBg(
      child: Scaffold(
        appBar: AppBar(
          title:  Text("slami"),
        ),
        body: verses.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.12,
                    right: size.width * 0.05,
                    left: size.width * 0.05,
                    bottom: size.height * 0.1),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.surahName,
                          style: theme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        const Icon(Icons.play_circle_fill_rounded),
                      ],
                    ),
                    const Divider(
                      indent: 60,
                      endIndent: 60,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Text.rich(
                            TextSpan(
                                children: verses.map((e) {
                              return TextSpan(
                                  text: replaceArabicNumber(e.trim()),
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                      fontFamily:
                                          GoogleFonts.amiriQuran().fontFamily),
                                  children: [
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: (verses.indexWhere(
                                                    (element) => element == e) +
                                                1)
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontFamily: "aya",
                                                fontSize: 30)),
                                    TextSpan(text: " "),
                                  ]);
                            }).toList()),
                            textDirection: TextDirection.rtl,
                          );
                        },
                      ),
                    )
                  ],
                )),
              ),
      ),
    );
  }

  readFile(int index) async {
    surah = await rootBundle.loadString("assets/Suras/${index + 1}.txt");
    surah = surah.trim();
    verses = surah.split("\n");
    setState(() {});
  }

  String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }

    return input;
  }
}
