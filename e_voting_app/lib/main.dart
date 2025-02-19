import 'dart:io';
import 'package:e_voting_app/main_dasktop.dart';
import 'package:e_voting_app/main_mobile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
 
void main() {
  if (kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    runApp(MyDesktopApp());
  } else {
    runApp(MyMobileApp());
  }
}
