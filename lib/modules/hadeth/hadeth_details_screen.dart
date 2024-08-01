import 'package:flutter/material.dart';
import 'package:islami_1pm/core/widgets/custom_bg.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "hadethDetails";
   HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  String title = "";

  String body = "";

  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    if(title == ""){
      getHadethData(data);
    }
    return CustomBg(child: Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(
            top: size.height * 0.12,
            right: size.width * 0.05,
            left: size.width * 0.05,
            bottom: size.height * 0.1),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black26,spreadRadius: 2,blurRadius: 3)
            ],
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Column(
            children: [
              Text(title,style:theme.textTheme.bodyLarge,),
              const Divider(
                endIndent: 50,
                indent: 50,
              ),
              Text(body,style:theme.textTheme.bodyLarge,textDirection: TextDirection.rtl,),
            ],
          ),
        ),
      ),
    ));
  }

  getHadethData(String hadeth){
    hadeth  = hadeth.trim();
    title = hadeth.split("\n")[0];
    body = hadeth.split("\n")[1];
  }
}
