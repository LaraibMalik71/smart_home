import 'package:flutter/material.dart';

import '../models/room_model.dart';

class RoomProvider extends ChangeNotifier {
  final List<RoomModel> _rooms = [
    RoomModel(id: '1', name: 'Living Room'),
    RoomModel(id: '2', name: 'Bedroom'),
    RoomModel(id: '3', name: 'Kitchen'),
    RoomModel(id: '4', name: 'Entrance'),
  ];

  List<RoomModel> get rooms => List.unmodifiable(_rooms);

  int get totalRooms => _rooms.length;

  void addRoom(String name) {
    final trimmedName = name.trim();

    if (trimmedName.isEmpty) return;

    final alreadyExists = _rooms.any(
      (room) => room.name.toLowerCase() == trimmedName.toLowerCase(),
    );

    if (alreadyExists) return;

    _rooms.add(
      RoomModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: trimmedName,
      ),
    );

    notifyListeners();
  }

  void renameRoom(String id, String newName) {
    final trimmedName = newName.trim();

    if (trimmedName.isEmpty) return;

    final alreadyExists = _rooms.any(
      (room) =>
          room.id != id && room.name.toLowerCase() == trimmedName.toLowerCase(),
    );

    if (alreadyExists) return;

    final index = _rooms.indexWhere((room) => room.id == id);

    if (index == -1) return;

    _rooms[index] = _rooms[index].copyWith(name: trimmedName);

    notifyListeners();
  }

  void removeRoom(String id) {
    _rooms.removeWhere((room) => room.id == id);
    notifyListeners();
  }

  bool roomExists(String name) {
    return _rooms.any(
      (room) => room.name.toLowerCase() == name.trim().toLowerCase(),
    );
  }
}
