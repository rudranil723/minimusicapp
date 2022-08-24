import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimusicapp/model/radio.dart';
import 'package:minimusicapp/utils/ai_util.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //here we have a problem and rn no solution to it
  List<MyRadio>? radios;

  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios = MyRadioList.fromJson(radioJson).radios;
    print(radios);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: [
          VxAnimatedBox()
              //this lower part is for the gradient colors
              .size(context.screenWidth, context.screenHeight)
              .withGradient(LinearGradient(colors: [
                AIColors.primaryColor1,
                AIColors.PrimaryColor2,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight))
              .make(),
          //now we will make a app bar
          AppBar(
            title: "mini Play".text.xl4.bold.white.make().shimmer(
                primaryColor: Vx.purple300, secondaryColor: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100.0).p16()
        ], //children
      ),
    );
  }
}
