import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

// This main is just a wrapper for the main app.
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new App());
  });
}