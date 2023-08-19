import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmiCalculator(),
    ),
  );
}

class EmiCalculator extends StatefulWidget {
  const EmiCalculator({Key? key}) : super(key: key);

  @override
  State<EmiCalculator> createState() => _EmiCalculatorState();
}

class _EmiCalculatorState extends State<EmiCalculator> {
  List<Map> data = [
    {
      'text': "Loan Amount",
      'min': 10000.0,
      'max': 500000.0,
      'val': 100000.0,
      'div': 100,
      'label': "",
    },
    {
      'text': "Interest Rate",
      'min': 6.0,
      'max': 24.0,
      'val': 10.0,
      'div': 18,
      'label': "%",
    },
    {
      'text': "Loan Tenure",
      'min': 1.0,
      'max': 60.0,
      'val': 12.0,
      'div': 60,
      'label': " months",
    }
  ];

  String emi = '00.00';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EMI Calculator",
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.grid_view,
        ),
        backgroundColor: const Color(0xff20295C),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff20295C),
                  Color(0xff0F2027),
                ],
                stops: [0.07, 0.2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Your Loan EMI is",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "₹ $emi",
                        style: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      const TextSpan(
                        text: " / Month",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.75,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[0]['text'],
                        style: const TextStyle(
                          color: Color(0xff484848),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            data[0]['text'],
                            style: const TextStyle(
                              color: Color(0xffE5E6E8),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${data[0]['val'].toInt()} ${data[0]['label']}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Theme(
                        data: ThemeData(
                          sliderTheme: const SliderThemeData(
                            activeTrackColor: Color(0xff8f9dff),
                            inactiveTrackColor: Color(0xff8f9dff),
                            trackHeight: 1,
                            trackShape: RectangularSliderTrackShape(),
                            thumbColor: Color(0xff20295C),
                          ),
                        ),
                        child: SizedBox(
                          height: 20,
                          width: 300,
                          child: Slider(
                            min: data[0]['min'],
                            max: data[0]['max'],
                            divisions: data[0]['div'],
                            value: data[0]['val'],
                            onChanged: (val) {
                              setState(() {
                                data[0]['val'] = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[1]['text'],
                        style: const TextStyle(
                          color: Color(0xff484848),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            data[1]['text'],
                            style: const TextStyle(
                              color: Color(0xffE5E6E8),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${data[1]['val'].toInt()} ${data[1]['label']}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Theme(
                        data: ThemeData(
                          sliderTheme: const SliderThemeData(
                            activeTrackColor: Color(0xff8f9dff),
                            inactiveTrackColor: Color(0xff8f9dff),
                            trackHeight: 1,
                            trackShape: RectangularSliderTrackShape(),
                            thumbColor: Color(0xff20295C),
                          ),
                        ),
                        child: SizedBox(
                          height: 20,
                          width: 300,
                          child: Slider(
                            min: data[1]['min'],
                            max: data[1]['max'],
                            divisions: data[1]['div'],
                            value: data[1]['val'],
                            onChanged: (val) {
                              setState(() {
                                data[1]['val'] = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[2]['text'],
                        style: const TextStyle(
                          color: Color(0xff484848),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            data[2]['text'],
                            style: const TextStyle(
                              color: Color(0xffE5E6E8),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${data[2]['val'].toInt()} ${data[2]['label']}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Theme(
                        data: ThemeData(
                          sliderTheme: const SliderThemeData(
                            activeTrackColor: Color(0xff8f9dff),
                            inactiveTrackColor: Color(0xff8f9dff),
                            trackHeight: 1,
                            trackShape: RectangularSliderTrackShape(),
                            thumbColor: Color(0xff20295C),
                          ),
                        ),
                        child: SizedBox(
                          height: 20,
                          width: 300,
                          child: Slider(
                            min: data[2]['min'],
                            max: data[2]['max'],
                            divisions: data[2]['div'],
                            value: data[2]['val'],
                            onChanged: (val) {
                              setState(() {
                                data[2]['val'] = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Ink(
                    decoration: BoxDecoration(
                      color: const Color(0xffE7EaFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          double P = data[0]['val'];

                          double R = data[1]['val'] / 12 / 100;

                          double N = data[2]['val'];

                          emi =
                              (P * R * pow((1 + R), N) / ((pow(1 + R, N)) - 1))
                                  .toString();

                          List spilt = emi.split('.');

                          emi = spilt[0] + "." + spilt[1][0] + spilt[1][0];
                        });
                      },
                      splashColor: const Color(0xff20295C),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.55,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff8f9dff),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2C397E),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
