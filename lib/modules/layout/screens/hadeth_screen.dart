import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_1pm/modules/hadeth/hadeth_details_screen.dart';

class HadethScreen extends StatefulWidget {
  HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<String> hadeth = [];

  List<String> hadethTitle = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (hadeth.isEmpty) {
      readFile();
    }
    return Center(
      child: Column(
        children: [
          Image.asset("assets/Images/hadeth_logo.png"),
          const Divider(),
          Text(
            "Ahadeth",
            style: theme.textTheme.bodyLarge,
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: hadethTitle.length,
              itemBuilder: (context, index) {
                return InkWell(

                  onTap: () {
                    Navigator.pushNamed(context, HadethDetailsScreen.routeName,arguments:hadeth[index] );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(hadethTitle[index], textAlign: TextAlign.center,style: theme.textTheme.bodyLarge,),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  readFile() async {
    String text = await rootBundle.loadString("assets/Hadeeth/ahadeth.txt");
    hadeth = text.split("#");
    for (int i = 0; i < hadeth.length; i++) {
      String hadethText = hadeth[i].trim();
      String title = hadethText.split("\n")[0];
      hadethTitle.add(title);
    }
    setState(() {});
  }
}
