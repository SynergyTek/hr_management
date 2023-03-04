// import 'dart:io';

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// import '../data/models/user_location_model.dart';

// // class LocationDatabaseProvider {
// //   // Singleton pattern
// //   static final LocationDatabaseProvider _databaseService =
// //       LocationDatabaseProvider._internal();
// //   factory LocationDatabaseProvider() => _databaseService;
// //   LocationDatabaseProvider._internal();

// //   static Database? _database;

// //   Future<Database> get database async {
// //     if (_database != null) return _database!;
// //     // Initialize the DB first time it is accessed
// //     _database = await _initDatabase();
// //     return _database!;
// //   }

// //   Future<Database> _initDatabase() async {
// //     final databasePath = await getDatabasesPath();

// //     // Set the path to the database. Note: Using the `join` function from the
// //     // `path` package is best practice to ensure the path is correctly
// //     // constructed for each platform.
// //     final path = join(databasePath, 'hrm_location.db');

// //     // Set the version. This executes the onCreate function and provides a
// //     // path to perform database upgrades and downgrades.
// //     return await openDatabase(
// //       path,
// //       onCreate: _onCreate,
// //       version: 1,
// //       onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
// //     );
// //   }

// //   // When the database is first created, create a table to store breeds
// //   // and a table to store dogs.
// //   Future<void> _onCreate(Database db, int version) async {
// //     // Run the CREATE {locations} TABLE statement on the database.
// //     await db.execute(
// //       'CREATE TABLE locations(id INTEGER PRIMARY KEY, time TEXT, latitude REAL, longitude REAL)',
// //     );
// //   }

// //   Future<void> insertLocation(UserLocation userLocation) async {
// //     // Get a reference to the database.
// //     final db = await _databaseService.database;

// //     // Insert the Locations into the correct table. You might also specify the
// //     // `conflictAlgorithm` to use in case the same Location is inserted twice.
// //     //
// //     // In this case, replace any previous data.
// //     await db.insert(
// //       'locations',
// //       userLocation.toMap(),
// //       conflictAlgorithm: ConflictAlgorithm.replace,
// //     );
// //   }

// //   Future<List<UserLocation>> getAllUserLocations() async {
// //     // Get a reference to the database.
// //     final db = await _databaseService.database;

// //     // Query the table for all the locations.
// //     final List<Map<String, dynamic>> maps = await db.query('locations');

// //     try {
// //       // Convert the List<Map<String, dynamic> into a List<Breed>.
// //       List<UserLocation> list = List.generate(
// //           maps.length, (index) => UserLocation.fromMap(maps[index]));
// //       return list;
// //     } catch (e) {
// //       print(e);
// //       return [];
// //     }
// //   }
// // }

// class LocationDatabaseProvider {
// // Singleton pattern
//   static final LocationDatabaseProvider _databaseService =
//       LocationDatabaseProvider._internal();
//   factory LocationDatabaseProvider() => _databaseService;
//   LocationDatabaseProvider._internal();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     // Initialize the DB first time it is accessed
//     _database = await getDatabaseInstance();
//     return _database!;
//   }

//   Future<Database> getDatabaseInstance() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, "savedLocation.db");
//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute("CREATE TABLE UserLocation ("
//           "id INTEGER PRIMARY KEY,"
//           "time TEXT,"
//           "latitude REAL,"
//           "longitude REAL"
//           ")");
//     });
//   }

//   addLocationToDatabase(UserLocation userLocation) async {
//     final db = await database;
//     var raw = await db.insert(
//       "UserLocation",
//       userLocation.toJson(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     return raw;
//   }

//   updateUserLocation(UserLocation userLocation) async {
//     print("UserLocation: ${userLocation.latitude} ${userLocation.longitude}");

//     final db = await database;
//     var response = await db.update("UserLocation", userLocation.toJson(),
//         where: "id = ?", whereArgs: [userLocation.id]);
//     return response;
//   }

//   Future<List<UserLocation>> getAllUserLocations() async {
//     final db = await database;
//     var response = await db.query("UserLocation");

//     try {
//       List<UserLocation> list =
//           response.map((c) => UserLocation.fromJson(c)).toList();
//       return list;
//     } catch (e) {
//       print(e);
//       return [];
//     }
//   }

//   deleteSingleUserLocationWithId(int id) async {
//     final db = await database;
//     return db.delete("UserLocation", where: "id = ?", whereArgs: [id]);
//   }

//   deleteAllUserLocations() async {
//     final db = await database;
//     db.delete("UserLocation");
//   }
// }
