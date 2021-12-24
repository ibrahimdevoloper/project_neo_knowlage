import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/answers.dart';

@dao
abstract class AnswerDao {
  @Query('SELECT * FROM Answers')
  Future<List<Answer>> findAllAnswers();

  @Query('SELECT * FROM Answers')
  Stream<List<Answer>> findAllAnswersAsStream();

  @insert
  Future<void> insertAnswer(Answer answer);

//TODO: add update, delete and find byQuestionId
  @Update(onConflict:OnConflictStrategy.replace)
  Future<void> updateAnswer(Answer answer);

  @delete
  Future<void> deleteAnswer(Answer answer);

  @Query('SELECT * FROM Answers WHERE questionId = :id')
  Future<List<Answer>> findAllAnswersByQuestionId(int id);

  @Query('SELECT * FROM Answers WHERE questionId = :id')
  Stream<List<Answer>> findAllAnswersByQuestionIdAsStream(int id);

}
