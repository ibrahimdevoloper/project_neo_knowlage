import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/sessions.dart';

@Entity(
  tableName: 'Questions',
  foreignKeys: [
    ForeignKey(
        childColumns: ['sessionId'], parentColumns: ['id'], entity: Session)
  ],
)
class Question {
  @PrimaryKey(autoGenerate: true)
  int? id;

  late String question;
  late int sessionId;

  Question(this.question, this.sessionId);
}
