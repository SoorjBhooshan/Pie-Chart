import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dataMap = {'X': 100.0, 'Y': 120.0, 'Z': 50.0};

  String? _value = 'disc';
  bool isOutSide = false;
  bool _switchValue = false;
  bool showPercentage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              RadioListTile(
                tileColor: Colors.lightBlueAccent,
                shape: const StadiumBorder(),
                title: const Text('Disc'),
                value: 'disc',
                groupValue: _value,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    isOutSide = false;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RadioListTile(
                tileColor: Colors.lightBlueAccent,
                shape: const StadiumBorder(),
                title: const Text('Ring'),
                value: 'ring',
                groupValue: _value,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    isOutSide = true;
                  });
                },
              ),
              Expanded(
                child: PieChart(
                  dataMap: dataMap,
                  chartType: _value == 'ring' ? ChartType.ring : ChartType.disc,
                  centerText: 'Pie Chart',
                  baseChartColor: Colors.amber,
                  chartValuesOptions: ChartValuesOptions(
                    showChartValuesInPercentage: showPercentage,
                    showChartValuesOutside: isOutSide,
                    showChartValueBackground: true,
                  ),
                  legendOptions:
                      const LegendOptions(legendPosition: LegendPosition.top),
                ),
              
              ),
              const SizedBox(height: 20,),
              const Text('Show Percentage'),
                CupertinoSwitch(

              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                  showPercentage = !showPercentage;
                  
                });
              },
            ),
            ],
          ),
        ),
      ),
    );
  }
}
