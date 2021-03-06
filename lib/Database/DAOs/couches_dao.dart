import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/couches.dart';

@dao
abstract class CouchDao {
  @Query('SELECT * FROM Couches')
  Future<List<Couch>> findAllCouches();

  @Query('SELECT * FROM Couches')
  Stream<List<Couch>> findAllCouchesAsStream();

  @insert
  Future<void> insertCouch(Couch couch);

  @Update(onConflict:OnConflictStrategy.replace)
  Future<void> updateCouch(Couch couch);

  @delete
  Future<void> deleteCouch(Couch couch);

}