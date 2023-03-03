import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../data/models/user_location_model.dart';

class LocationDatabaseProvider {
// Singleton pattern
  static final LocationDatabaseProvider _databaseService =
      LocationDatabaseProvider._internal();
  factory LocationDatabaseProvider() => _databaseService;
  LocationDatabaseProvider._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await getDatabaseInstance();
    return _database!;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "savedLocation.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE UserLocation ("
          "id INTEGER PRIMARY KEY,"
          "time TEXT,"
          "latitude REAL,"
          "longitude REAL"
          ")");
    });
  }

  addLocationToDatabase(UserLocation alertLocation) async {
    final db = await database;
    var raw = await db.insert(
      "UserLocation",
      alertLocation.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  updateUserLocation(UserLocation userLocation) async {
    print("UserLocation: ${userLocation.latitude} ${userLocation.longitude}");

    final db = await database;
    var response = await db.update("UserLocation", userLocation.toJson(),
        where: "id = ?", whereArgs: [userLocation.id]);
    return response;
  }

  Future<List<UserLocation>> getAllUserLocations() async {
    final db = await database;
    var response = await db.query("UserLocation");

    try {
      List<UserLocation> list =
          response.map((c) => UserLocation.fromJson(c)).toList();
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  deleteSingleUserLocationWithId(int id) async {
    final db = await database;
    return db.delete("UserLocation", where: "id = ?", whereArgs: [id]);
  }

  deleteAllUserLocations() async {
    final db = await database;
    db.delete("UserLocation");
  }
}
