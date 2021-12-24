// ignore_for_file: file_names

import 'package:floor/floor.dart';

@Entity(
  tableName: 'Devices',
)
class Device {
  @PrimaryKey(autoGenerate: true)
  int? id;

  //TODO: add devices information

  Device();
}
