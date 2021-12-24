// database.dart

// required package imports

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:project_neo_knowlage/Database/DAOs/answers_dao.dart';
import 'package:project_neo_knowlage/Database/DAOs/couches_dao.dart';
import 'package:project_neo_knowlage/Database/DAOs/courses_dao.dart';
import 'package:project_neo_knowlage/Database/DAOs/devices_dao.dart';
import 'package:project_neo_knowlage/Database/DAOs/questions_dao.dart';
import 'package:project_neo_knowlage/Database/DAOs/sessions_dao.dart';
import 'package:project_neo_knowlage/Database/DAOs/students_answers_dao.dart';
import 'package:project_neo_knowlage/Database/DAOs/students_dao.dart';
import 'package:project_neo_knowlage/Database/entities/answers.dart';
import 'package:project_neo_knowlage/Database/entities/couches.dart';
import 'package:project_neo_knowlage/Database/entities/courses.dart';
import 'package:project_neo_knowlage/Database/entities/devices.dart';
import 'package:project_neo_knowlage/Database/entities/questions.dart';
import 'package:project_neo_knowlage/Database/entities/sessions.dart';
import 'package:project_neo_knowlage/Database/entities/students.dart';
import 'package:project_neo_knowlage/Database/entities/students_answers.dart';


import 'package:sqflite/sqflite.dart' as sqflite;



part 'database.g.dart'; // the generated code will be there

@Database(version: 2, entities: [
  Answer,
  Couch,
  Course,
  Device,
  Question,
  Session,
  Student,
  StudentsAnswer
])
abstract class AppDatabase extends FloorDatabase {
  AnswerDao get answerDao;

  CouchDao get couchDao;

  CourseDao get courseDao;

  DeviceDao get deviceDao;

  QuestionDao get questionDao;

  SessionDao get sessionDao;

  StudentDao get studentDao;

  StudentsAnswerDao get studentsAnswerDao;
}
