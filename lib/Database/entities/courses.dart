import 'package:floor/floor.dart';

import 'couches.dart';

@Entity(
  tableName: 'Courses',
  foreignKeys: [
    ForeignKey(childColumns: ['couchId'], parentColumns: ['id'], entity: Couch)
  ],
)
class Course {
  @PrimaryKey(autoGenerate: true)
  int? id;

  late String name;
  /// we put here both the date and time
  late String startDate;
  late String endDate;
  late String startTime;
  late String endTime;
  late int couchId;

  Course(this.id, this.name, this.startDate, this.endDate, this.startTime,
      this.endTime, this.couchId);
}
