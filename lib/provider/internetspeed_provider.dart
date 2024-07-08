import 'package:flutter/material.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';

class InternetspeedProvider extends ChangeNotifier {
  final FlutterInternetSpeedTest _speedTest = FlutterInternetSpeedTest();
  double _downloadSpeed = 0.0;
  double _uploadSpeed = 0.0;
  dynamic _speedUnit = '--';
  bool _isTest = false;

  dynamic _isp = '';

  dynamic _ip = '';
  String _string = '';
  get speedTest => _speedTest;
  get downloadSpeed => _downloadSpeed;
  get uploadSpeed => _uploadSpeed;
  get isp => _isp;
  get ip => _ip;
  get string => _string;

  get speedUnit => _speedUnit;
  get isTestComplete => _isTest;

  testDownloadSpeed() async {
    _isTest = false;
    _speedTest.startTesting(
      onStarted: () {},
      onProgress: (percent, data) {
        _isTest = true;
        _downloadSpeed = data.transferRate;

        _speedUnit = data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';
        notifyListeners();
      },
      onDownloadComplete: (data) {
        _isTest = false;
        _downloadSpeed = data.transferRate;
        _speedUnit = data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';

        notifyListeners();
      },
      onDefaultServerSelectionDone: (client) {
        _isTest = false;
        _ip = client?.ip;
        _isp = client?.isp ?? 'connecting';
      },
      onCompleted: (download, upload) {
        _isTest = false;
        _downloadSpeed = download.transferRate;

        notifyListeners();
      },
    );
  }

  void reset() {
    _downloadSpeed = 0.0;
    _uploadSpeed = 0.0;
    _speedUnit = '--';
    _isp = '';
    _ip = '';
    _string = '';
    notifyListeners();
  }
}
