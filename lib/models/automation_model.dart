class AutomationModel {
  final String id;
  final String title;
  final String deviceId;
  final String deviceName;
  final String action;
  final String scheduledTime;
  final bool isEnabled;

  AutomationModel({
    required this.id,
    required this.title,
    required this.deviceId,
    required this.deviceName,
    required this.action,
    required this.scheduledTime,
    this.isEnabled = true,
  });

  AutomationModel copyWith({
    String? title,
    String? deviceId,
    String? deviceName,
    String? action,
    String? scheduledTime,
    bool? isEnabled,
  }) {
    return AutomationModel(
      id: id,
      title: title ?? this.title,
      deviceId: deviceId ?? this.deviceId,
      deviceName: deviceName ?? this.deviceName,
      action: action ?? this.action,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}
