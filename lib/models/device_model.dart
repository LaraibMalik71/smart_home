enum DeviceType { light, fan, airConditioner, tv, plug, lock, camera, sensor }

class DeviceModel {
  final String id;
  final String name;
  final DeviceType type;
  final String roomName;
  final bool isOn;
  final double brightness;
  final int fanSpeed;
  final int temperature;
  final double energyUsage;

  DeviceModel({
    required this.id,
    required this.name,
    required this.type,
    required this.roomName,
    this.isOn = false,
    this.brightness = 50,
    this.fanSpeed = 1,
    this.temperature = 24,
    this.energyUsage = 0,
  });

  DeviceModel copyWith({
    String? name,
    DeviceType? type,
    String? roomName,
    bool? isOn,
    double? brightness,
    int? fanSpeed,
    int? temperature,
    double? energyUsage,
  }) {
    return DeviceModel(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      roomName: roomName ?? this.roomName,
      isOn: isOn ?? this.isOn,
      brightness: brightness ?? this.brightness,
      fanSpeed: fanSpeed ?? this.fanSpeed,
      temperature: temperature ?? this.temperature,
      energyUsage: energyUsage ?? this.energyUsage,
    );
  }
}
