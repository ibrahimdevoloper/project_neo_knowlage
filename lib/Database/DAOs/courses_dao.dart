import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/courses.dart';

@dao
abstract class CourseDao {
  @Query('SELECT * FROM Courses')
  Future<List<Course>> findAllCourses();

  @Query('SELECT * FROM Courses')
  Stream<List<Course>> findAllCoursesAsStream();

  @insert
  Future<void> insertCourse(Course course);

  //TODO: add update, delete and findByCouchId
  @Update(onConflict:OnConflictStrategy.replace)
  Future<void> updateCourse(Course course);

  @delete
  Future<void> deleteCourse(Course course);

  @Query('SELECT * FROM Courses WHERE couchId = :id')
  Future<List<Course>> findAllCoursesByCouchId(int id);

  @Query('SELECT * FROM Courses WHERE couchId = :id')
  Stream<List<Course>> findAllCoursesByCouchIdAsStream(int id);
}