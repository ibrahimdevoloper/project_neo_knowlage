import 'package:get/get.dart';
import 'package:project_neo_knowlage/Database/database.dart';


class DatabaseGlobalController extends GetxController{

  AppDatabase? database;
  static const databaseName="project_neo";

  DatabaseGlobalController(this.database);

  ///static function to initialize the local database
  static Future<AppDatabase> getDatabase() async {
    return await $FloorAppDatabase.databaseBuilder('$databaseName.db').build();
  }
}