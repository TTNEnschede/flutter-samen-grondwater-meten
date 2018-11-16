import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'models.dart';

@immutable
class AppState {

  final AppTab activeTab;
  final User user;

  AppState({
    this.activeTab = AppTab.overzicht,
    this.user,
  });

  factory AppState.initial() =>
      AppState(
          user: null);
}