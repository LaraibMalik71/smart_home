class RoomModel {
  final String id;
  final String name;

  RoomModel({required this.id, required this.name});

  RoomModel copyWith({String? name}) {
    return RoomModel(id: id, name: name ?? this.name);
  }
}
