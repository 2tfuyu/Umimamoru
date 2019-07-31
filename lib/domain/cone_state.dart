import 'package:flutter/material.dart';
import 'package:umimamoru_flutter/domain/entity.dart';
import 'package:umimamoru_flutter/domain/wave_speed.dart';

class ConeState implements Entity {

  String _cone;
  String _level;
  double _speed;
  int _count_occur;

  ConeState(
    @required this._cone,
    @required this._level,
    @required this._speed,
    @required this._count_occur
  ) :  assert(_cone != null),
        assert(_level != null),
        assert(_speed != null),
        assert(_count_occur != null);

  String get cone => _cone;

  String get level => _level;

  double get speed => _speed;

  int get occur_count => _count_occur;
}