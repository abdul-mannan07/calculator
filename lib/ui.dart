import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class UiDesign extends StatefulWidget {
  const UiDesign({super.key});

  @override
  State<UiDesign> createState() => _UiDesignState();
}

class _UiDesignState extends State<UiDesign> {
  var inPut = "";
  var outPut = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        inPut,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(outPut, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        title: "AC",
                        onPress: () {
                          inPut = "";
                          outPut = "";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "+/-",
                        onPress: () {
                          inPut += "+/-";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "%",
                        onPress: () {
                          inPut += "%";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "/",
                        color: Color(0xffffA500),
                        onPress: () {
                          inPut += "/";
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "7",
                        onPress: () {
                          inPut += "7";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "8",
                        onPress: () {
                          inPut += "8";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "0",
                        onPress: () {
                          inPut += "0";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "x",
                        color: Color(0xffffA500),
                        onPress: () {
                          inPut += "x";
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "4",
                        onPress: () {
                          inPut += "4";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "5",
                        onPress: () {
                          inPut += "5";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "6",
                        onPress: () {
                          inPut += "6";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "-",
                        color: Color(0xffffA500),
                        onPress: () {
                          inPut += "-";
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "1",
                        onPress: () {
                          inPut += "1";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "2",
                        onPress: () {
                          inPut += "2";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "3",
                        onPress: () {
                          inPut += "3";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "+",
                        color: Color(0xffffA500),
                        onPress: () {
                          inPut += "+";
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "0",
                        onPress: () {
                          inPut += "0";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: ".",
                        onPress: () {
                          inPut += ".";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "del",
                        onPress: () {
                          inPut = inPut.substring(0, inPut.length - 1);
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "=",
                        color: Color(0xffffA500),
                        onPress: () {
                          equalPress();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalPress() {
    String finalINput = inPut;
    finalINput = finalINput.replaceAll("x", "*");
    Parser p = Parser();
    Expression expression = p.parse(finalINput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    outPut = eval.toString();
  }
}
