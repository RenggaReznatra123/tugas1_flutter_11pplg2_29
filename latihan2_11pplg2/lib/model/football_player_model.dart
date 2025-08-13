import 'package:flutter/material.dart';

class FootballPlayer {
  String name;
  String number;
  String position;
  ImageProvider image;

  FootballPlayer({
    required this.name,
    required this.number,
    required this.position,
    required this.image,
  });

  factory FootballPlayer.fromMap(Map<String, dynamic> map) {
    return FootballPlayer(
      name: map['name'] ?? '',
      number: map['number'] ?? '',
      position: map['position'] ?? '',
      image: map['image'] ?? const AssetImage('assets/default.png'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'position': position,
      'image': image,
    };
  }
}
