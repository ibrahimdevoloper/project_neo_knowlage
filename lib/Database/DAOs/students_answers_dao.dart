import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/students_answers.dart';

@dao
abstract class StudentsAnswerDao {
  @Query('SELECT * FROM Students_Answers')
  Future<List<StudentsAnswer>> findAllStudentsAnswer();

  @Query('SELECT * FROM Students_Answers')
  Stream<List<StudentsAnswer>> findAllStudentsAnswerAsStream();

  @insert
  Future<void> insertStudentsAnswer(StudentsAnswer studentsAnswer);

//TODO: add update, delete, find studentId and  find answerId

  @Update(onConflict:OnConflictStrategy.replace)
  Future<void> updateStudentsAnswer(StudentsAnswer studentsAnswer);

  @delete
  Future<void> deleteStudentsAnswer(StudentsAnswer studentsAnswer);

  @Query('SELECT * FROM Students_Answers WHERE studentId = :id')
  Future<List<StudentsAnswer>> findAllStudentsAnswersByStudentId(int id);

  @Query('SELECT * FROM Students_Answers WHERE studentId = :id')
  Stream<List<StudentsAnswer>> findAllStudentsAnswersByStudentIdAsStream(int id);

  @Query('SELECT * FROM Students_Answers WHERE answerId = :id')
  Future<List<StudentsAnswer>> findAllStudentsAnswersByAnswerId(int id);

  @Query('SELECT * FROM Students_Answers WHERE answerId = :id')
  Stream<List<StudentsAnswer>> findAllStudentsAnswersByAnswerIdAsStream(int id);
}
