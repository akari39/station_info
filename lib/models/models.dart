import 'package:flutter/material.dart';

enum TrainType { local, rapid, express, limitedExpress }

extension TrainTypeExtension on TrainType {
  String toShortString() {
    return toString().split('.').last; // Converts TrainType.local to "local"
  }

  static TrainType fromString(String value) {
    return TrainType.values.firstWhere((type) => type.toShortString() == value, orElse: () => TrainType.local);
  }
}

class Train {
  final String time;
  final TrainType type;
  final String terminus;
  final int? timeLeft;
  final List<String> stops;

  Train({
    required this.time,
    required this.type,
    required this.terminus,
    this.timeLeft,
    required this.stops,
  });

  String? get typeText {
    switch (type) {
      case TrainType.local:
        return 'Local';
      case TrainType.rapid:
        return 'Rapid';
      case TrainType.limitedExpress:
        return 'Express';
      default:
        return null;
    }
  }

  Color? getTypeColor(BuildContext context) {
    final ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;
    switch (type) {
      case TrainType.local:
        return colorScheme.outlineVariant;
      case TrainType.rapid:
        return colorScheme.errorContainer;
      case TrainType.limitedExpress:
        return colorScheme.error;
      default:
        return null;
    }
  }

  factory Train.fromJson(Map<String, dynamic> json) {
    return Train(
      time: json['time'],
      type: TrainTypeExtension.fromString(json['type']),
      terminus: json['terminus'],
      timeLeft: json['timeLeft'],
      stops: List<String>.from(json['stops']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'type': type.toShortString(),
      'terminus': terminus,
      'timeLeft': timeLeft,
      'stops': stops,
    };
  }
}

class Platform {
  final int platformNo;
  final String lineName;
  final String bound;
  final List<Train> trains;

  Platform({
    required this.platformNo,
    required this.lineName,
    required this.bound,
    required this.trains,
  });

  factory Platform.fromJson(Map<String, dynamic> json) {
    return Platform(
      platformNo: json['platformNo'],
      lineName: json['lineName'],
      bound: json['bound'],
      trains: (json['trains'] as List).map((train) => Train.fromJson(train)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'platformNo': platformNo,
      'lineName': lineName,
      'bound': bound,
      'trains': trains.map((train) => train.toJson()).toList(),
    };
  }
}