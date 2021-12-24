// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AnswerDao? _answerDaoInstance;

  CouchDao? _couchDaoInstance;

  CourseDao? _courseDaoInstance;

  DeviceDao? _deviceDaoInstance;

  QuestionDao? _questionDaoInstance;

  SessionDao? _sessionDaoInstance;

  StudentDao? _studentDaoInstance;

  StudentsAnswerDao? _studentsAnswerDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Answers` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `answer` TEXT NOT NULL, `isCorrect` INTEGER NOT NULL, `questionId` TEXT NOT NULL, FOREIGN KEY (`questionId`) REFERENCES `Questions` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Couches` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `username` TEXT NOT NULL, `password` TEXT NOT NULL, `isAdmin` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Courses` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `startDateTime` TEXT NOT NULL, `endDateTime` TEXT NOT NULL, `couchId` INTEGER NOT NULL, FOREIGN KEY (`couchId`) REFERENCES `Couches` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Devices` (`id` INTEGER PRIMARY KEY AUTOINCREMENT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Questions` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `question` TEXT NOT NULL, `sessionId` INTEGER NOT NULL, FOREIGN KEY (`sessionId`) REFERENCES `Sessions` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Sessions` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `filePath` TEXT NOT NULL, `courseId` INTEGER NOT NULL, FOREIGN KEY (`courseId`) REFERENCES `Courses` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Students` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `phoneNumber` TEXT NOT NULL, `email` TEXT NOT NULL, `deviceId` INTEGER NOT NULL, `courseId` INTEGER NOT NULL, FOREIGN KEY (`deviceId`) REFERENCES `Devices` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`courseId`) REFERENCES `Courses` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Students_Answers` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `studentId` INTEGER NOT NULL, `answerId` INTEGER NOT NULL, FOREIGN KEY (`studentId`) REFERENCES `Students` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`answerId`) REFERENCES `Answers` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AnswerDao get answerDao {
    return _answerDaoInstance ??= _$AnswerDao(database, changeListener);
  }

  @override
  CouchDao get couchDao {
    return _couchDaoInstance ??= _$CouchDao(database, changeListener);
  }

  @override
  CourseDao get courseDao {
    return _courseDaoInstance ??= _$CourseDao(database, changeListener);
  }

  @override
  DeviceDao get deviceDao {
    return _deviceDaoInstance ??= _$DeviceDao(database, changeListener);
  }

  @override
  QuestionDao get questionDao {
    return _questionDaoInstance ??= _$QuestionDao(database, changeListener);
  }

  @override
  SessionDao get sessionDao {
    return _sessionDaoInstance ??= _$SessionDao(database, changeListener);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }

  @override
  StudentsAnswerDao get studentsAnswerDao {
    return _studentsAnswerDaoInstance ??=
        _$StudentsAnswerDao(database, changeListener);
  }
}

class _$AnswerDao extends AnswerDao {
  _$AnswerDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _answerInsertionAdapter = InsertionAdapter(
            database,
            'Answers',
            (Answer item) => <String, Object?>{
                  'id': item.id,
                  'answer': item.answer,
                  'isCorrect': item.isCorrect ? 1 : 0,
                  'questionId': item.questionId
                },
            changeListener),
        _answerUpdateAdapter = UpdateAdapter(
            database,
            'Answers',
            ['id'],
            (Answer item) => <String, Object?>{
                  'id': item.id,
                  'answer': item.answer,
                  'isCorrect': item.isCorrect ? 1 : 0,
                  'questionId': item.questionId
                },
            changeListener),
        _answerDeletionAdapter = DeletionAdapter(
            database,
            'Answers',
            ['id'],
            (Answer item) => <String, Object?>{
                  'id': item.id,
                  'answer': item.answer,
                  'isCorrect': item.isCorrect ? 1 : 0,
                  'questionId': item.questionId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Answer> _answerInsertionAdapter;

  final UpdateAdapter<Answer> _answerUpdateAdapter;

  final DeletionAdapter<Answer> _answerDeletionAdapter;

  @override
  Future<List<Answer>> findAllAnswers() async {
    return _queryAdapter.queryList('SELECT * FROM Answers',
        mapper: (Map<String, Object?> row) => Answer(row['answer'] as String,
            (row['isCorrect'] as int) != 0, row['questionId'] as String));
  }

  @override
  Stream<List<Answer>> findAllAnswersAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Answers',
        mapper: (Map<String, Object?> row) => Answer(row['answer'] as String,
            (row['isCorrect'] as int) != 0, row['questionId'] as String),
        queryableName: 'Answers',
        isView: false);
  }

  @override
  Future<List<Answer>> findAllAnswersByQuestionId(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Answers WHERE questionId = ?1',
        mapper: (Map<String, Object?> row) => Answer(row['answer'] as String,
            (row['isCorrect'] as int) != 0, row['questionId'] as String),
        arguments: [id]);
  }

  @override
  Stream<List<Answer>> findAllAnswersByQuestionIdAsStream(int id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Answers WHERE questionId = ?1',
        mapper: (Map<String, Object?> row) => Answer(row['answer'] as String,
            (row['isCorrect'] as int) != 0, row['questionId'] as String),
        arguments: [id],
        queryableName: 'Answers',
        isView: false);
  }

  @override
  Future<void> insertAnswer(Answer answer) async {
    await _answerInsertionAdapter.insert(answer, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAnswer(Answer answer) async {
    await _answerUpdateAdapter.update(answer, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteAnswer(Answer answer) async {
    await _answerDeletionAdapter.delete(answer);
  }
}

class _$CouchDao extends CouchDao {
  _$CouchDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _couchInsertionAdapter = InsertionAdapter(
            database,
            'Couches',
            (Couch item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'username': item.username,
                  'password': item.password,
                  'isAdmin': item.isAdmin ? 1 : 0
                },
            changeListener),
        _couchUpdateAdapter = UpdateAdapter(
            database,
            'Couches',
            ['id'],
            (Couch item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'username': item.username,
                  'password': item.password,
                  'isAdmin': item.isAdmin ? 1 : 0
                },
            changeListener),
        _couchDeletionAdapter = DeletionAdapter(
            database,
            'Couches',
            ['id'],
            (Couch item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'username': item.username,
                  'password': item.password,
                  'isAdmin': item.isAdmin ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Couch> _couchInsertionAdapter;

  final UpdateAdapter<Couch> _couchUpdateAdapter;

  final DeletionAdapter<Couch> _couchDeletionAdapter;

  @override
  Future<List<Couch>> findAllCouches() async {
    return _queryAdapter.queryList('SELECT * FROM Couches',
        mapper: (Map<String, Object?> row) => Couch(
            row['name'] as String,
            row['username'] as String,
            row['password'] as String,
            (row['isAdmin'] as int) != 0));
  }

  @override
  Stream<List<Couch>> findAllCouchesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Couches',
        mapper: (Map<String, Object?> row) => Couch(
            row['name'] as String,
            row['username'] as String,
            row['password'] as String,
            (row['isAdmin'] as int) != 0),
        queryableName: 'Couches',
        isView: false);
  }

  @override
  Future<void> insertCouch(Couch couch) async {
    await _couchInsertionAdapter.insert(couch, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCouch(Couch answer) async {
    await _couchUpdateAdapter.update(answer, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCouch(Couch answer) async {
    await _couchDeletionAdapter.delete(answer);
  }
}

class _$CourseDao extends CourseDao {
  _$CourseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _courseInsertionAdapter = InsertionAdapter(
            database,
            'Courses',
            (Course item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'startDateTime': item.startDateTime,
                  'endDateTime': item.endDateTime,
                  'couchId': item.couchId
                },
            changeListener),
        _courseUpdateAdapter = UpdateAdapter(
            database,
            'Courses',
            ['id'],
            (Course item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'startDateTime': item.startDateTime,
                  'endDateTime': item.endDateTime,
                  'couchId': item.couchId
                },
            changeListener),
        _courseDeletionAdapter = DeletionAdapter(
            database,
            'Courses',
            ['id'],
            (Course item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'startDateTime': item.startDateTime,
                  'endDateTime': item.endDateTime,
                  'couchId': item.couchId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Course> _courseInsertionAdapter;

  final UpdateAdapter<Course> _courseUpdateAdapter;

  final DeletionAdapter<Course> _courseDeletionAdapter;

  @override
  Future<List<Course>> findAllCourses() async {
    return _queryAdapter.queryList('SELECT * FROM Courses',
        mapper: (Map<String, Object?> row) => Course(
            row['name'] as String,
            row['startDateTime'] as String,
            row['endDateTime'] as String,
            row['couchId'] as int));
  }

  @override
  Stream<List<Course>> findAllCoursesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Courses',
        mapper: (Map<String, Object?> row) => Course(
            row['name'] as String,
            row['startDateTime'] as String,
            row['endDateTime'] as String,
            row['couchId'] as int),
        queryableName: 'Courses',
        isView: false);
  }

  @override
  Future<List<Course>> findAllCoursesByCouchId(int id) async {
    return _queryAdapter.queryList('SELECT * FROM Courses WHERE couchId = ?1',
        mapper: (Map<String, Object?> row) => Course(
            row['name'] as String,
            row['startDateTime'] as String,
            row['endDateTime'] as String,
            row['couchId'] as int),
        arguments: [id]);
  }

  @override
  Stream<List<Course>> findAllCoursesByCouchIdAsStream(int id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Courses WHERE couchId = ?1',
        mapper: (Map<String, Object?> row) => Course(
            row['name'] as String,
            row['startDateTime'] as String,
            row['endDateTime'] as String,
            row['couchId'] as int),
        arguments: [id],
        queryableName: 'Courses',
        isView: false);
  }

  @override
  Future<void> insertCourse(Course course) async {
    await _courseInsertionAdapter.insert(course, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCourse(Course course) async {
    await _courseUpdateAdapter.update(course, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCourse(Course course) async {
    await _courseDeletionAdapter.delete(course);
  }
}

class _$DeviceDao extends DeviceDao {
  _$DeviceDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _deviceInsertionAdapter = InsertionAdapter(database, 'Devices',
            (Device item) => <String, Object?>{'id': item.id}, changeListener),
        _deviceUpdateAdapter = UpdateAdapter(database, 'Devices', ['id'],
            (Device item) => <String, Object?>{'id': item.id}, changeListener),
        _deviceDeletionAdapter = DeletionAdapter(database, 'Devices', ['id'],
            (Device item) => <String, Object?>{'id': item.id}, changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Device> _deviceInsertionAdapter;

  final UpdateAdapter<Device> _deviceUpdateAdapter;

  final DeletionAdapter<Device> _deviceDeletionAdapter;

  @override
  Future<List<Device>> findAllDevices() async {
    return _queryAdapter.queryList('SELECT * FROM Devices',
        mapper: (Map<String, Object?> row) => Device());
  }

  @override
  Stream<List<Device>> findAllDevicesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Devices',
        mapper: (Map<String, Object?> row) => Device(),
        queryableName: 'Devices',
        isView: false);
  }

  @override
  Future<void> insertDevice(Device device) async {
    await _deviceInsertionAdapter.insert(device, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateDevice(Device device) async {
    await _deviceUpdateAdapter.update(device, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteDevice(Device device) async {
    await _deviceDeletionAdapter.delete(device);
  }
}

class _$QuestionDao extends QuestionDao {
  _$QuestionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _questionInsertionAdapter = InsertionAdapter(
            database,
            'Questions',
            (Question item) => <String, Object?>{
                  'id': item.id,
                  'question': item.question,
                  'sessionId': item.sessionId
                },
            changeListener),
        _questionUpdateAdapter = UpdateAdapter(
            database,
            'Questions',
            ['id'],
            (Question item) => <String, Object?>{
                  'id': item.id,
                  'question': item.question,
                  'sessionId': item.sessionId
                },
            changeListener),
        _questionDeletionAdapter = DeletionAdapter(
            database,
            'Questions',
            ['id'],
            (Question item) => <String, Object?>{
                  'id': item.id,
                  'question': item.question,
                  'sessionId': item.sessionId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Question> _questionInsertionAdapter;

  final UpdateAdapter<Question> _questionUpdateAdapter;

  final DeletionAdapter<Question> _questionDeletionAdapter;

  @override
  Future<List<Question>> findAllQuestions() async {
    return _queryAdapter.queryList('SELECT * FROM Questions',
        mapper: (Map<String, Object?> row) =>
            Question(row['question'] as String, row['sessionId'] as int));
  }

  @override
  Stream<List<Question>> findAllQuestionsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Questions',
        mapper: (Map<String, Object?> row) =>
            Question(row['question'] as String, row['sessionId'] as int),
        queryableName: 'Questions',
        isView: false);
  }

  @override
  Future<List<Question>> findAllQuestionsBySessionId(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Questions WHERE sessionId = ?1',
        mapper: (Map<String, Object?> row) =>
            Question(row['question'] as String, row['sessionId'] as int),
        arguments: [id]);
  }

  @override
  Stream<List<Question>> findAllQuestionsBySessionIdAsStream(int id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Questions WHERE sessionId = ?1',
        mapper: (Map<String, Object?> row) =>
            Question(row['question'] as String, row['sessionId'] as int),
        arguments: [id],
        queryableName: 'Questions',
        isView: false);
  }

  @override
  Future<void> insertQuestion(Question question) async {
    await _questionInsertionAdapter.insert(question, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateQuestion(Question question) async {
    await _questionUpdateAdapter.update(question, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteQuestion(Question question) async {
    await _questionDeletionAdapter.delete(question);
  }
}

class _$SessionDao extends SessionDao {
  _$SessionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _sessionInsertionAdapter = InsertionAdapter(
            database,
            'Sessions',
            (Session item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'filePath': item.filePath,
                  'courseId': item.courseId
                },
            changeListener),
        _sessionUpdateAdapter = UpdateAdapter(
            database,
            'Sessions',
            ['id'],
            (Session item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'filePath': item.filePath,
                  'courseId': item.courseId
                },
            changeListener),
        _sessionDeletionAdapter = DeletionAdapter(
            database,
            'Sessions',
            ['id'],
            (Session item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'filePath': item.filePath,
                  'courseId': item.courseId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Session> _sessionInsertionAdapter;

  final UpdateAdapter<Session> _sessionUpdateAdapter;

  final DeletionAdapter<Session> _sessionDeletionAdapter;

  @override
  Future<List<Session>> findAllSessions() async {
    return _queryAdapter.queryList('SELECT * FROM Sessions',
        mapper: (Map<String, Object?> row) => Session(
            row['title'] as String,
            row['description'] as String,
            row['filePath'] as String,
            row['courseId'] as int));
  }

  @override
  Stream<List<Session>> findAllSessionsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Sessions',
        mapper: (Map<String, Object?> row) => Session(
            row['title'] as String,
            row['description'] as String,
            row['filePath'] as String,
            row['courseId'] as int),
        queryableName: 'Sessions',
        isView: false);
  }

  @override
  Future<List<Session>> findAllSessionsByCourseId(int id) async {
    return _queryAdapter.queryList('SELECT * FROM Sessions WHERE courseId = ?1',
        mapper: (Map<String, Object?> row) => Session(
            row['title'] as String,
            row['description'] as String,
            row['filePath'] as String,
            row['courseId'] as int),
        arguments: [id]);
  }

  @override
  Stream<List<Session>> findAllSessionsByCourseIdAsStream(int id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Sessions WHERE courseId = ?1',
        mapper: (Map<String, Object?> row) => Session(
            row['title'] as String,
            row['description'] as String,
            row['filePath'] as String,
            row['courseId'] as int),
        arguments: [id],
        queryableName: 'Sessions',
        isView: false);
  }

  @override
  Future<void> insertSession(Session session) async {
    await _sessionInsertionAdapter.insert(session, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSession(Session question) async {
    await _sessionUpdateAdapter.update(question, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSession(Session question) async {
    await _sessionDeletionAdapter.delete(question);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'Students',
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email,
                  'deviceId': item.deviceId,
                  'courseId': item.courseId
                },
            changeListener),
        _studentUpdateAdapter = UpdateAdapter(
            database,
            'Students',
            ['id'],
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email,
                  'deviceId': item.deviceId,
                  'courseId': item.courseId
                },
            changeListener),
        _studentDeletionAdapter = DeletionAdapter(
            database,
            'Students',
            ['id'],
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email,
                  'deviceId': item.deviceId,
                  'courseId': item.courseId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  final UpdateAdapter<Student> _studentUpdateAdapter;

  final DeletionAdapter<Student> _studentDeletionAdapter;

  @override
  Future<List<Student>> findAllStudents() async {
    return _queryAdapter.queryList('SELECT * FROM Students',
        mapper: (Map<String, Object?> row) => Student(
            row['name'] as String,
            row['phoneNumber'] as String,
            row['email'] as String,
            row['deviceId'] as int,
            row['courseId'] as int));
  }

  @override
  Stream<List<Student>> findAllStudentsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Students',
        mapper: (Map<String, Object?> row) => Student(
            row['name'] as String,
            row['phoneNumber'] as String,
            row['email'] as String,
            row['deviceId'] as int,
            row['courseId'] as int),
        queryableName: 'Students',
        isView: false);
  }

  @override
  Future<List<Student>> findAllStudentsByDeviceId(int id) async {
    return _queryAdapter.queryList('SELECT * FROM Students WHERE deviceId = ?1',
        mapper: (Map<String, Object?> row) => Student(
            row['name'] as String,
            row['phoneNumber'] as String,
            row['email'] as String,
            row['deviceId'] as int,
            row['courseId'] as int),
        arguments: [id]);
  }

  @override
  Stream<List<Student>> findAllStudentsByDeviceIdAsStream(int id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Students WHERE deviceId = ?1',
        mapper: (Map<String, Object?> row) => Student(
            row['name'] as String,
            row['phoneNumber'] as String,
            row['email'] as String,
            row['deviceId'] as int,
            row['courseId'] as int),
        arguments: [id],
        queryableName: 'Students',
        isView: false);
  }

  @override
  Future<List<Student>> findAllStudentsByCourseId(int id) async {
    return _queryAdapter.queryList('SELECT * FROM Students WHERE courseId = ?1',
        mapper: (Map<String, Object?> row) => Student(
            row['name'] as String,
            row['phoneNumber'] as String,
            row['email'] as String,
            row['deviceId'] as int,
            row['courseId'] as int),
        arguments: [id]);
  }

  @override
  Stream<List<Student>> findAllStudentsByCourseIdAsStream(int id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Students WHERE courseId = ?1',
        mapper: (Map<String, Object?> row) => Student(
            row['name'] as String,
            row['phoneNumber'] as String,
            row['email'] as String,
            row['deviceId'] as int,
            row['courseId'] as int),
        arguments: [id],
        queryableName: 'Students',
        isView: false);
  }

  @override
  Future<void> insertStudent(Student student) async {
    await _studentInsertionAdapter.insert(student, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateStudent(Student student) async {
    await _studentUpdateAdapter.update(student, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteStudent(Student student) async {
    await _studentDeletionAdapter.delete(student);
  }
}

class _$StudentsAnswerDao extends StudentsAnswerDao {
  _$StudentsAnswerDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _studentsAnswerInsertionAdapter = InsertionAdapter(
            database,
            'Students_Answers',
            (StudentsAnswer item) => <String, Object?>{
                  'id': item.id,
                  'studentId': item.studentId,
                  'answerId': item.answerId
                },
            changeListener),
        _studentsAnswerUpdateAdapter = UpdateAdapter(
            database,
            'Students_Answers',
            ['id'],
            (StudentsAnswer item) => <String, Object?>{
                  'id': item.id,
                  'studentId': item.studentId,
                  'answerId': item.answerId
                },
            changeListener),
        _studentsAnswerDeletionAdapter = DeletionAdapter(
            database,
            'Students_Answers',
            ['id'],
            (StudentsAnswer item) => <String, Object?>{
                  'id': item.id,
                  'studentId': item.studentId,
                  'answerId': item.answerId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StudentsAnswer> _studentsAnswerInsertionAdapter;

  final UpdateAdapter<StudentsAnswer> _studentsAnswerUpdateAdapter;

  final DeletionAdapter<StudentsAnswer> _studentsAnswerDeletionAdapter;

  @override
  Future<List<StudentsAnswer>> findAllStudentsAnswer() async {
    return _queryAdapter.queryList('SELECT * FROM Students_Answers',
        mapper: (Map<String, Object?> row) =>
            StudentsAnswer(row['studentId'] as int, row['answerId'] as int));
  }

  @override
  Stream<List<StudentsAnswer>> findAllStudentsAnswerAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Students_Answers',
        mapper: (Map<String, Object?> row) =>
            StudentsAnswer(row['studentId'] as int, row['answerId'] as int),
        queryableName: 'Students_Answers',
        isView: false);
  }

  @override
  Future<List<StudentsAnswer>> findAllStudentsAnswersByStudentId(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Students_Answers WHERE studentId = ?1',
        mapper: (Map<String, Object?> row) =>
            StudentsAnswer(row['studentId'] as int, row['answerId'] as int),
        arguments: [id]);
  }

  @override
  Stream<List<StudentsAnswer>> findAllStudentsAnswersByStudentIdAsStream(
      int id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Students_Answers WHERE studentId = ?1',
        mapper: (Map<String, Object?> row) =>
            StudentsAnswer(row['studentId'] as int, row['answerId'] as int),
        arguments: [id],
        queryableName: 'Students_Answers',
        isView: false);
  }

  @override
  Future<List<StudentsAnswer>> findAllStudentsAnswersByAnswerId(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Students_Answers WHERE answerId = ?1',
        mapper: (Map<String, Object?> row) =>
            StudentsAnswer(row['studentId'] as int, row['answerId'] as int),
        arguments: [id]);
  }

  @override
  Stream<List<StudentsAnswer>> findAllStudentsAnswersByAnswerIdAsStream(
      int id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Students_Answers WHERE answerId = ?1',
        mapper: (Map<String, Object?> row) =>
            StudentsAnswer(row['studentId'] as int, row['answerId'] as int),
        arguments: [id],
        queryableName: 'Students_Answers',
        isView: false);
  }

  @override
  Future<void> insertStudentsAnswer(StudentsAnswer studentsAnswer) async {
    await _studentsAnswerInsertionAdapter.insert(
        studentsAnswer, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateStudentsAnswer(StudentsAnswer studentsAnswer) async {
    await _studentsAnswerUpdateAdapter.update(
        studentsAnswer, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteStudentsAnswer(StudentsAnswer studentsAnswer) async {
    await _studentsAnswerDeletionAdapter.delete(studentsAnswer);
  }
}
