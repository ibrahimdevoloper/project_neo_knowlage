import 'package:get/get.dart';
import 'package:project_neo_knowlage/Database/Controller/database_global_controller.dart';
import 'package:project_neo_knowlage/Database/DAOs/couches_dao.dart';
import 'package:project_neo_knowlage/Database/entities/couches.dart';

class CouchesController extends GetxController {
  ///Displaying state variables
  bool _isLoading = false;
  bool _isError = false;
  String _message = "";
  List<Couch> _couches = [];

  /// for database basic functions
  late CouchDao _couchDao;

  /// For adding Couch
  String? _couchNameForAdding;
  String? _couchUsernameForAdding;
  String? _couchPasswordForAdding;
  String? _couchConfirmPasswordForAdding;
  bool _isAdminForAdding = false;

  @override
  void onInit() {
    DatabaseGlobalController _databaseController = Get.find();
    _couchDao = _databaseController.database!.couchDao;
    getAllCouchesAsStream();
    super.onInit();
  }

  /// to open a stream connection to the database for reactive experience
  getAllCouchesAsStream() async {
    // in case of long loading time
    _isLoading = true;
    update();
    // when the connection is established
    var onDone = (() {
      isLoading = false;
      update();
    });
    //when data is updated, deleted, or inserted
    var onData = ((List<Couch> event) {
      print("database: data from stream");
      if (event.isEmpty) {
        isLoading = false;
        isError = true;
        _message = "Please press the '+' button to add couch";
        update();
      } else {
        isLoading = false;
        couches = event;
        // update();
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
    _couchDao
        .findAllCouchesAsStream()
        .listen(onData, onError: onError, onDone: onDone);
  }

  isPasswordConfirmed() {
    return couchConfirmPasswordForAdding.compareTo(couchPasswordForAdding) == 0;
  }

  Future insertCouch() async {
    if (isPasswordConfirmed()) {
      await _couchDao.insertCouch(Couch(null,
          couchNameForAdding,
          couchUsernameForAdding,
          couchConfirmPasswordForAdding,
          isAdminForAdding));
      update();
    } else
      Get.snackbar("Error", "password don't match");
  }

  Future deleteCouch(Couch couch) async {
    await _couchDao.deleteCouch(couch);
    update();
  }

  Future updateCouch(Couch couch) async {
    await _couchDao.updateCouch(couch);
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

  bool get isAdminForAdding => _isAdminForAdding;

  set isAdminForAdding(bool value) {
    _isAdminForAdding = value;
    update();
  }

  String get couchConfirmPasswordForAdding => _couchConfirmPasswordForAdding!;

  set couchConfirmPasswordForAdding(String value) {
    _couchConfirmPasswordForAdding = value;
  }

  String get couchPasswordForAdding => _couchPasswordForAdding!;

  set couchPasswordForAdding(String value) {
    _couchPasswordForAdding = value;
  }

  String get couchUsernameForAdding => _couchUsernameForAdding!;

  set couchUsernameForAdding(String value) {
    _couchUsernameForAdding = value;
  }

  String get couchNameForAdding => _couchNameForAdding!;

  set couchNameForAdding(String value) {
    _couchNameForAdding = value;
  }

  List<Couch> get couches => _couches;

  set couches(List<Couch> value) {
    _couches = value;
    update();
  }
}
