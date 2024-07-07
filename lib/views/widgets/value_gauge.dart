import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class SpeedGauge extends StatelessWidget {
  final double val;
  const SpeedGauge({super.key, required this.val});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      child: AnimatedRadialGauge(
        duration: Duration(seconds: 1),
        axis: GaugeAxis(
            min: 0.0,
            max: 100.0,
            degrees: 180,
            style: GaugeAxisStyle(
              thickness: 5,
              background: Theme.of(context).colorScheme.surface,
              segmentSpacing: 2,
            ),
            pointer: GaugePointer.needle(
                width: 10,
                height: 60,
                // Theme.of(context).colorScheme.secondary
                color: Theme.of(context).colorScheme.secondary),
            progressBar: GaugeProgressBar.rounded(
                gradient: GaugeAxisGradient(colors: [
              Color.fromARGB(255, 31, 148, 105),
              Color(0xFFc91b00)
            ])),
            segments: [
              const GaugeSegment(
                from: 0,
                to: 25,
                color: Color(0xff06402b),
                cornerRadius: Radius.zero,
              ),
              const GaugeSegment(
                from: 25,
                to: 50,
                color: Color(0xffff5c00),
                cornerRadius: Radius.zero,
              ),
              const GaugeSegment(
                from: 50,
                to: 75,
                color: Color(0xFFed2100),
                cornerRadius: Radius.zero,
              ),
              const GaugeSegment(
                from: 75,
                to: 100,
                color: Color(0xFFc91b00),
                cornerRadius: Radius.zero,
              ),
            ]),
        value: val,
      ),
    );
  }
}
