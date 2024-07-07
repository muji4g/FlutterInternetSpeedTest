import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:provider/provider.dart';
import 'package:speed_test/provider/internetspeed_provider.dart';
import 'package:speed_test/provider/theme_provider.dart';
import 'package:speed_test/theme/appTheme.dart';

import 'package:speed_test/views/widgets/value_gauge.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = ThemeProvider();

    bool isDark =
        Theme.of(context).brightness == Brightness.light ? false : true;
    return Consumer<InternetspeedProvider>(
      builder: (context, InternetspeedProvider speedProvider, child) {
        bool isTesting = speedProvider.isTestComplete;
        double value = speedProvider.downloadSpeed;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Internet Speed Test',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: IconButton(
                    onPressed: themeProvider.toggleTheme,
                    icon: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 41,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Flutter Speed Test',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Download Speed',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SpeedGauge(
                        val: value,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value.toStringAsFixed(1),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 32,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            speedProvider.speedUnit.toString() ==
                                    'SpeedUnit.mbps'
                                ? 'Mbps'
                                : speedProvider.speedUnit.toString() ==
                                        'SpeedUnit.kbps'
                                    ? 'Kbps'
                                    : '--',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'isp : ${speedProvider.isp}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: isTesting ? 40 : 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: isTesting
                                ? Colors.transparent
                                : Theme.of(context).colorScheme.tertiary),
                        child: isTesting
                            ? CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.tertiary,
                              )
                            : TextButton(
                                onPressed: speedProvider.downloadSpeed != 0
                                    ? speedProvider.reset
                                    : speedProvider.testDownloadSpeed,
                                child: Text(
                                  speedProvider.downloadSpeed != 0
                                      ? 'Reset'
                                      : 'Start',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
