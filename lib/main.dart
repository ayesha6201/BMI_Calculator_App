import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePageScreen(),
    );
  }
}

class MyHomePageScreen extends StatefulWidget {
  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  var wtController = TextEditingController();
  var ftHController = TextEditingController();
  var inHController = TextEditingController();

  var BMI = 0.0;
  var bgColor = Colors.blue.shade200;
  var imagePath = "assets/images/questionmark.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: bgColor,
          child: Center(
            child: Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "BMI Calculator",
                        style:
                            TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    TextField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      controller: wtController,
                      decoration: InputDecoration(
                          labelText: "Weight in Kg : ",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5)
                          ),
                          icon: Icon(Icons.line_weight)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        controller: ftHController,
                        decoration: InputDecoration(
                          labelText: "Height in Feet : ",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5)),
                          icon: Icon(Icons.trending_up),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      controller: inHController,
                      decoration: InputDecoration(
                        labelText: 'Height in Inches : ',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 5)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: Colors.black, width: 5)),
                        icon: Icon(Icons.trending_up),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var wt = int.parse(wtController.text.toString());
                          var ft = int.parse(ftHController.text.toString());
                          var inch = int.parse(inHController.text.toString());

                          var totalin = (ft * 12) + inch;
                          var totalcm = totalin * 2.53;
                          var totalH = totalcm / 100;
                          BMI = wt / (pow(totalH, 2));

                          if (BMI > 25) {
                            bgColor = Colors.red.shade200;
                            imagePath = "assets/images/overweight.jpg";
                          } else if (BMI < 18) {
                            bgColor = Colors.yellow.shade200;
                            imagePath = "assets/images/underweight.png";
                          } else {
                            bgColor = Colors.green.shade200;
                            imagePath = "assets/images/healthy.jpg";
                          }

                          setState(() {});
                        },
                        child: Text("Calculate",
                            style: TextStyle(color: Colors.white, fontSize: 24))),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Your BMI is: ${BMI.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Image.asset(imagePath)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
