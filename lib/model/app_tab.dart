import 'package:flutter/material.dart';

enum AppTab { info, overzicht, configuratie }

const Map AppTabIcons = {
  AppTab.info: Icons.info,
  AppTab.overzicht: Icons.insert_chart,
  AppTab.configuratie: Icons.settings,
};