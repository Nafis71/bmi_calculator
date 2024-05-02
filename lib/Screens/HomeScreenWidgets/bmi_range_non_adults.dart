import 'package:bmi_calculator/Models/bmi_range_color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

late double bmi;

class BmiRangeNonAdults extends StatelessWidget {
  BmiRangeNonAdults({super.key,required double personBmi}){
    bmi = personBmi;
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          minimum: 0,
          maximum: 100,
          maximumLabels: 4,
          ranges: [
            GaugeRange(
              startValue: 0,
              endValue: 5,
              color: Colors.red,
              startWidth: 2,
            ),
            GaugeRange(
              startValue: 5,
              endValue: 85,
              color: Colors.green,
            ),
            GaugeRange(
              startValue: 85,
              endValue: 95,
              color: Colors.yellow,
            ),
            GaugeRange(
              startValue: 95,
              endValue: 100,
              color: Colors.red,
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
                    color: BmiRangeColor.bmiRangeColorNonAdults(bmi)),
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
