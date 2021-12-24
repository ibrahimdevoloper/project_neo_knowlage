import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/devices.dart';

@dao
abstract class DeviceDao {
  @Query('SELECT * FROM Devices')
  Future<List<Device>> findAllDevices();

  @Query('SELECT * FROM Devices')
  Stream<List<Device>> findAllDevicesAsStream();

  @insert
  Future<void> insertDevice(Device device);

//TODO: add update and delete
  @Update(onConflict:OnConflictStrategy.replace)
  Future<void> updateDevice(Device device);

  @delete
  Future<void> deleteDevice(Device device);
}
