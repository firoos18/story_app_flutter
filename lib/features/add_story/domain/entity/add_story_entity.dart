import 'dart:ffi';
import 'dart:io';

import 'package:equatable/equatable.dart';

class AddStoryEntity extends Equatable {
  final String description;
  final File photo;
  final Float? lat;
  final Float? lon;

  const AddStoryEntity(this.description, this.photo, this.lat, this.lon);

  @override
  List<Object?> get props => [
        description,
        photo,
        lat,
        lon,
      ];
}
