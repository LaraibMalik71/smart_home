import 'package:flutter/material.dart';

import '../models/device_model.dart';

class DeviceProvider extends ChangeNotifier {
  final List<DeviceModel> _devices = [
    DeviceModel(
      id: '1',
      name: 'Living Room Light',
      type: DeviceType.light,
      roomName: 'Living Room',
      isOn: true,
      brightness: 75,
      energyUsage: 0.08,
    ),
    DeviceModel(
      id: '2',
      name: 'Bedroom Fan',
      type: DeviceType.fan,
      roomName: 'Bedroom',
      isOn: true,
      fanSpeed: 2,
      energyUsage: 0.12,
    ),
    DeviceModel(
      id: '3',
      name: 'Living Room AC',
      type: DeviceType.airConditioner,
      roomName: 'Living Room',
      temperature: 24,
      energyUsage: 0.15,
    ),
    DeviceModel(
      id: '4',
      name: 'Bedroom TV',
      type: DeviceType.tv,
      roomName: 'Bedroom',
    ),
    DeviceModel(
      id: '5',
      name: 'Main Door Lock',
      type: DeviceType.lock,
      roomName: 'Entrance',
      isOn: true,
    ),
    DeviceModel(
      id: '6',
      name: 'Kitchen Light',
      type: DeviceType.light,
      roomName: 'Kitchen',
      brightness: 50,
      energyUsage: 0.06,
    ),
  ];

  List<DeviceModel> get devices => List.unmodifiable(_devices);

  int get totalDevices => _devices.length;

  int get activeDevices => _devices.where((device) => device.isOn).length;

  int get totalEnergyUsage => _devices
      .where((device) => device.isOn)
      .fold(0, (sum, device) => sum + device.energyUsage.round());

  List<DeviceModel> getDevicesByRoom(String roomName) {
    return _devices.where((device) => device.roomName == roomName).toList();
  }

  DeviceModel? getDeviceById(String id) {
    try {
      return _devices.firstWhere((device) => device.id == id);
    } catch (_) {
      return null;
    }
  }

  void toggleDevice(String id) {
    final index = _devices.indexWhere((device) => device.id == id);

    if (index == -1) return;

    final device = _devices[index];

    _devices[index] = device.copyWith(isOn: !device.isOn);

    notifyListeners();
  }

  void setDevicePower(String id, bool isOn) {
    final index = _devices.indexWhere((device) => device.id == id);

    if (index == -1) return;

    _devices[index] = _devices[index].copyWith(isOn: isOn);

    notifyListeners();
  }

  void setBrightness(String id, double brightness) {
    final index = _devices.indexWhere((device) => device.id == id);

    if (index == -1) return;

    _devices[index] = _devices[index].copyWith(
      brightness: brightness.clamp(0, 100).toDouble(),
    );

    notifyListeners();
  }

  void setFanSpeed(String id, int speed) {
    final index = _devices.indexWhere((device) => device.id == id);

    if (index == -1) return;

    _devices[index] = _devices[index].copyWith(fanSpeed: speed.clamp(1, 3));

    notifyListeners();
  }

  void setTemperature(String id, int temperature) {
    final index = _devices.indexWhere((device) => device.id == id);

    if (index == -1) return;

    _devices[index] = _devices[index].copyWith(
      temperature: temperature.clamp(16, 30),
    );

    notifyListeners();
  }

  void renameDevice(String id, String newName) {
    final index = _devices.indexWhere((device) => device.id == id);

    if (index == -1 || newName.trim().isEmpty) return;

    _devices[index] = _devices[index].copyWith(name: newName.trim());

    notifyListeners();
  }

  void addDevice({
    required String name,
    required DeviceType type,
    required String roomName,
  }) {
    _devices.add(
      DeviceModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: name,
        type: type,
        roomName: roomName,
      ),
    );

    notifyListeners();
  }

  void removeDevice(String id) {
    _devices.removeWhere((device) => device.id == id);

    notifyListeners();
  }

  void toggleRoomDevices(String roomName, bool isOn) {
    for (int i = 0; i < _devices.length; i++) {
      if (_devices[i].roomName == roomName) {
        _devices[i] = _devices[i].copyWith(isOn: isOn);
      }
    }

    notifyListeners();
  }
}
