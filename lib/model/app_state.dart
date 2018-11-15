import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'models.dart';

@immutable
class AppState {

  final User user;

  AppState({
    this.user,
  });

  factory AppState.initial() =>
      AppState(
          user: null);
}