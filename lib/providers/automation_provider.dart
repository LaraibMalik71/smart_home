import 'package:flutter/material.dart';

import '../models/automation_model.dart';

class AutomationProvider extends ChangeNotifier {
  final List<AutomationModel> _automations = [];

  List<AutomationModel> get automations => List.unmodifiable(_automations);

  int get totalAutomations => _automations.length;

  int get activeAutomations =>
      _automations.where((item) => item.isEnabled).length;

  void addAutomation({
    required String title,
    required String deviceId,
    required String deviceName,
    required String action,
    required String scheduledTime,
  }) {
    _automations.add(
      AutomationModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: title,
        deviceId: deviceId,
        deviceName: deviceName,
        action: action,
        scheduledTime: scheduledTime,
      ),
    );

    notifyListeners();
  }

  void toggleAutomation(String id) {
    final index = _automations.indexWhere((item) => item.id == id);

    if (index == -1) return;

    final automation = _automations[index];

    _automations[index] = automation.copyWith(isEnabled: !automation.isEnabled);

    notifyListeners();
  }

  void removeAutomation(String id) {
    _automations.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
