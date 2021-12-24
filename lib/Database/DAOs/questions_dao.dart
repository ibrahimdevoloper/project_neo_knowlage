import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/questions.dart';

@dao
abstract class QuestionDao {
  @Query('SELECT * FROM Questions')
  Future<List<Question>> findAllQuestions();

  @Query('SELECT * FROM Questions')
  Stream<List<Question>> findAllQuestionsAsStream();

  @insert
  Future<void> insertQuestion(Question question);

//TODO: add update, delete and find bySessionId

  @Update(onConflict:OnConflictStrategy.replace)
  Future<void> updateQuestion(Question question);

  @delete
  Future<void> deleteQuestion(Question question);

  @Query('SELECT * FROM Questions WHERE sessionId = :id')
  Future<List<Question>> findAllQuestionsBySessionId(int id);

  @Query('SELECT * FROM Questions WHERE sessionId = :id')
  Stream<List<Question>> findAllQuestionsBySessionIdAsStream(int id);
}
