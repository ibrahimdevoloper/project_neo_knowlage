import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/sessions.dart';

@dao
abstract class SessionDao {
  @Query('SELECT * FROM Sessions')
  Future<List<Session>> findAllSessions();

  @Query('SELECT * FROM Sessions')
  Stream<List<Session>> findAllSessionsAsStream();

  @insert
  Future<void> insertSession(Session session);

//TODO: add update, delete and find byCourseId

  @Update(onConflict:OnConflictStrategy.replace)
  Future<void> updateSession(Session question);

  @delete
  Future<void> deleteSession(Session question);

  @Query('SELECT * FROM Sessions WHERE courseId = :id')
  Future<List<Session>> findAllSessionsByCourseId(int id);

  @Query('SELECT * FROM Sessions WHERE courseId = :id')
  Stream<List<Session>> findAllSessionsByCourseIdAsStream(int id);
}
