import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/questions.dart';

@Entity(
  tableName: 'Answers',
  foreignKeys: [
    ForeignKey(
        childColumns: ['questionId'], parentColumns: ['id'], entity: Question)
  ],
)
class Answer {
  @PrimaryKey(autoGenerate: true)
  int? id;

  late String answer;
  late bool isCorrect;
  late String questionId;

  Answer(this.answer, this.isCorrect, this.questionId);
}