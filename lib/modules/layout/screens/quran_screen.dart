import 'package:flutter/material.dart';
import 'package:islami_1pm/modules/layout/widgets/surah_name_widget.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Image.asset('assets/Images/qur2an_screen_logo.png'),
          const Divider(),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Surah Name",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              )),
              SizedBox(
                  height: size.height * 0.05, child: const VerticalDivider()),
              Expanded(
                  child: Text(
                "Surah Verses",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              )),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 114,
              itemBuilder: (context, index) {
                return SurahNameWidget(index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}
