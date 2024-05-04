import 'package:bmi_calculator/Models/bmi_range_color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

late double bmi;

class BmiRangeAdults extends StatelessWidget {
  BmiRangeAdults({super.key, required double personBmi}){
   bmi =  personBmi;
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          minimum: 10,
          maximum: 50,
          maximumLabels: 5,
          ranges: [
            GaugeRange(
              startValue: 10,
              endValue: 18.4,
              color: Colors.red,
              startWidth: 2,
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: Colors.green,
            ),
            GaugeRange(
              startValue: 25,
              endValue: 29.9,
              color: Colors.yellow,
            ),
            GaugeRange(
              startValue: 30,
              endValue: 39.9,
              color: Colors.orange,
            ),
            GaugeRange(
              startValue: 40,
              endValue: 50,
              color: Colors.red,
              endWidth: 2,
            ),
          ],
          pointers: [
            NeedlePointer(
              value: bmi,
              enableAnimation: true,
              animationDuration: 2600,
            )
          ],
          annotations: [
            GaugeAnnotation(
              widget: Text(
                bmi.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: BmiRangeColor.bmiRangeColorAdults(bmi)),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        )
      ],
    );
  }
}
