import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/students.dart';

@dao
abstract class StudentDao {
  @Query('SELECT * FROM Students')
  Future<List<Student>> findAllStudents();

  @Query('SELECT * FROM Students')
  Stream<List<Student>> findAllStudentsAsStream();

  @insert
  Future<void> insertStudent(Student student);

//TODO: add update, delete, find byCourseId and  find byDeviceId

  @Update(onConflict:OnConflictStrategy.replace)
  Future<void> updateStudent(Student student);

  @delete
  Future<void> deleteStudent(Student student);

  @Query('SELECT * FROM Students WHERE deviceId = :id')
  Future<List<Student>> findAllStudentsByDeviceId(int id);

  @Query('SELECT * FROM Students WHERE deviceId = :id')
  Stream<List<Student>> findAllStudentsByDeviceIdAsStream(int id);

  @Query('SELECT * FROM Students WHERE courseId = :id')
  Future<List<Student>> findAllStudentsByCourseId(int id);

  @Query('SELECT * FROM Students WHERE courseId = :id')
  Stream<List<Student>> findAllStudentsByCourseIdAsStream(int id);
}
