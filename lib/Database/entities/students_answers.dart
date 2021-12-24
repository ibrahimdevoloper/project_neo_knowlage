import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/answers.dart';
import 'package:project_neo_knowlage/Database/entities/students.dart';



@Entity(
  tableName: 'Students_Answers',
  foreignKeys: [
    ForeignKey(
        childColumns: ['studentId'], parentColumns: ['id'], entity: Student),
    ForeignKey(
        childColumns: ['answerId'], parentColumns: ['id'], entity: Answer),
  ],
)
class StudentsAnswer {
  @PrimaryKey(autoGenerate: true)
  int? id;

  late int studentId;
  late int answerId;

  StudentsAnswer(this.studentId, this.answerId);
}
