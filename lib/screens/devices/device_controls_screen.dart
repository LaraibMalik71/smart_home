import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/device_model.dart';
import '../../providers/device_provider.dart';

class DeviceControlsScreen extends StatelessWidget {
  const DeviceControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Controls'), centerTitle: true),
      body: Consumer<DeviceProvider>(
        builder: (context, provider, child) {
          final devices = provider.devices;

          if (devices.isEmpty) {
            return const Center(child: Text('No devices available'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: devices.length,
            itemBuilder: (context, index) {
              final device = devices[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _getDeviceIcon(device.type),
                            size: 28,
                            color: device.isOn
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  device.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  device.roomName,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: device.isOn,
                            onChanged: (_) {
                              provider.toggleDevice(device.id);
                            },
                          ),
                        ],
                      ),

                      if (device.type == DeviceType.light && device.isOn) ...[
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Brightness'),
                            Text('${device.brightness.round()}%'),
                          ],
                        ),
                        Slider(
                          value: device.brightness,
                          min: 0,
                          max: 100,
                          divisions: 100,
                          onChanged: (value) {
                            provider.setBrightness(device.id, value);
                          },
                        ),
                      ],

                      if (device.type == DeviceType.fan && device.isOn) ...[
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Fan Speed'),
                            Text('Level ${device.fanSpeed}'),
                          ],
                        ),
                        Slider(
                          value: device.fanSpeed.toDouble(),
                          min: 1,
                          max: 3,
                          divisions: 2,
                          onChanged: (value) {
                            provider.setFanSpeed(device.id, value.round());
                          },
                        ),
                      ],

                      if (device.type == DeviceType.airConditioner &&
                          device.isOn) ...[
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Temperature'),
                            Text('${device.temperature}°C'),
                          ],
                        ),
                        Slider(
                          value: device.temperature.toDouble(),
                          min: 16,
                          max: 30,
                          divisions: 14,
                          onChanged: (value) {
                            provider.setTemperature(device.id, value.round());
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  IconData _getDeviceIcon(DeviceType type) {
    switch (type) {
      case DeviceType.light:
        return Icons.lightbulb_outline;
      case DeviceType.fan:
        return Icons.air;
      case DeviceType.airConditioner:
        return Icons.ac_unit;
      case DeviceType.tv:
        return Icons.tv;
      case DeviceType.plug:
        return Icons.power;
      case DeviceType.lock:
        return Icons.lock_outline;
      case DeviceType.camera:
        return Icons.camera_alt_outlined;
      case DeviceType.sensor:
        return Icons.sensors;
    }
  }
}
