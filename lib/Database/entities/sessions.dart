import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/entities/courses.dart';

@Entity(
  tableName: 'Sessions',
  foreignKeys: [
    ForeignKey(childColumns: ['courseId'], parentColumns: ['id'], entity: Course)
  ],
)
class Session {
  @PrimaryKey(autoGenerate: true)
  int? id;

  late  String title;
  late String description;
  late String filePath;
  late int courseId;

  Session(this.id,this.title, this.description, this.filePath, this.courseId);
}