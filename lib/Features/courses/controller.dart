import 'package:get/get.dart';
import 'package:project_neo_knowlage/Database/Controller/database_global_controller.dart';
import 'package:project_neo_knowlage/Database/DAOs/courses_dao.dart';
import 'package:project_neo_knowlage/Database/entities/courses.dart';

class CoursesController extends GetxController {
  ///Displaying state variables
  bool _isLoading = false;
  bool _isError = false;
  String _message = "";
  List<Course> _courses = [];

  /// for database basic functions
  late CourseDao _courseDao;

  /// to know the who get courses
  late int _couchId;

  /// For adding Course
  String? _courseNameForAdding;
  String? _courseStartDateForAdding;
  String? _courseEndDateForAdding;
  String? _courseStartTimeForAdding;
  String? _courseEndTimeForAdding;

  CoursesController(this._couchId);

  @override
  void onInit() {
    DatabaseGlobalController _databaseController = Get.find();
    _courseDao = _databaseController.database!.courseDao;
    getAllCoursesAsStream();
    super.onInit();
  }

  /// to open a stream connection to the database for reactive experience
  getAllCoursesAsStream() async {
    // in case of long loading time
    _isLoading = true;
    update();
    // when the connection is established
    var onDone = (() {
      isLoading = false;
      update();
    });
    //when data is updated, deleted, or inserted
    var onData = ((List<Course> event) {
      print("database: data from stream");
      if (event.isEmpty) {
        isLoading = false;
        isError = true;
        _message = "Please press the '+' button to add couch";
        update();
      } else {
        isLoading = false;
        isError = false;
        courses = event;
        update();
      }
    });
    // when the connection has an error
    var onError = ((e) {
      isLoading = false;
      isError = true;
      message = "error: $e";
      update();
    });
    // start listen to the connection
    _courseDao
        .findAllCoursesByCouchIdAsStream(_couchId)
        .listen(onData, onError: onError, onDone: onDone);
  }
  //
  // isPasswordConfirmed() {
  //   return couchConfirmPasswordForAdding.compareTo(couchPasswordForAdding) == 0;
  // }

  Future insertCourse() async {
      //TODO: add course
    print(_couchId);
      await _courseDao.insertCourse(
        Course(
          null,
          _courseNameForAdding!,
          _courseStartDateForAdding!,
          _courseEndDateForAdding!,
          _courseStartTimeForAdding!,
          _courseEndTimeForAdding!,
          couchId,
        ),
      );
      update();
  }

  Future deleteCourse(Course course) async {
    //TODO: confirmation dialog
    _courseDao.deleteCourse(course);
    update();
  }

  Future updateCourse(Course course) async {
    // await _couchDao.updateCouch(couch);
    //TODO: update course
    update();
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<Course> get courses => _courses;

  set courses(List<Course> value) {
    _courses = value;
  }

  int get couchId => _couchId;

  set couchId(int value) {
    _couchId = value;
  }

  String? get courseEndTimeForAdding => _courseEndTimeForAdding;

  set courseEndTimeForAdding(String? value) {
    _courseEndTimeForAdding = value;
    update();
  }

  String? get courseStartTimeForAdding => _courseStartTimeForAdding;

  set courseStartTimeForAdding(String? value) {
    _courseStartTimeForAdding = value;
    update();
  }

  String? get courseEndDateForAdding => _courseEndDateForAdding;

  set courseEndDateForAdding(String? value) {
    _courseEndDateForAdding = value;
    update();
  }

  String? get courseStartDateForAdding => _courseStartDateForAdding;

  set courseStartDateForAdding(String? value) {
    _courseStartDateForAdding = value;
    update();
  }

  String? get courseNameForAdding => _courseNameForAdding;

  set courseNameForAdding(String? value) {
    _courseNameForAdding = value;
    update();
  }
}
