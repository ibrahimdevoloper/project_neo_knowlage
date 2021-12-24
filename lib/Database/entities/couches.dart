import 'package:floor/floor.dart';

@Entity(
  tableName: 'Couches',
)
class Couch {
  @PrimaryKey(autoGenerate: true)
  int? id;

  late  String name;
  late String username;
  late String password;
  late bool isAdmin;

  Couch(this.name, this.username, this.password, this.isAdmin);
}