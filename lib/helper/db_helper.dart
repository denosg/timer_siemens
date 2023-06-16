import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as p;

import '../providers/preferred_timer.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  // static call of the db for easier access of the methods :)
  static sql.Database? _database;

  DatabaseHelper._();

  // gets the database for the UI to use since _database is private
  Future<sql.Database> get database async {
    if (_database != null) return _database!;

    // waiting for the database to initialize with the corresponding values
    _database = await _initDatabase();
    return _database!;
  }

  // method for deleting a preffered timer by index
  Future<void> deletePreferredTimerByIndex(int index) async {
    final db = await instance.database;
    await db.delete(
      'preferred_timers',
      where: 'id = ?',
      whereArgs: [index + 1], // SQLite uses 1-based indexing for primary keys
    );
  }

  // method for initialising the database
  Future<sql.Database> _initDatabase() async {
    // gets the path of the db
    final String dbPath = await sql.getDatabasesPath();
    final String databasePath = p.join(dbPath, 'preferred_timers.db');

    // opens the found db, if it exists, if it doesn't, it creates one
    return sql.openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE preferred_timers (
            id INTEGER PRIMARY KEY,
            hours INTEGER,
            minutes INTEGER,
            seconds INTEGER
          )
          ''',
        );
      },
    );
  }

  // gets the preferred timers from the db
  Future<List<PreferredTimer>> getPreferredTimers() async {
    // waits for the db to load (since we are talking about phone memory, we use await)
    final db = await instance.database;
    // gets the information and queries it to save it in a useable format in the UI (List<PreferredTimer>)
    final List<Map<String, dynamic>> timersMap =
        await db.query('preferred_timers');
    // we now have the 'hours', 'minutes', 'seconds' values for them to be added and returned as a List<PreferredTimer>
    return timersMap.map((timerMap) {
      return PreferredTimer(
        hours: timerMap['hours'],
        minutes: timerMap['minutes'],
        seconds: timerMap['seconds'],
      );
    }).toList();
  }

  // method for adding a preferred timer in the device memory
  Future<void> addPreferredTimer(PreferredTimer timer) async {
    // we wait for the db to load (since we are talking about phone memory, we use await)
    final db = await instance.database;
    // inserts in the db the values with their corresponding key ('hours', 'minutes', 'seconds')
    await db.insert(
      'preferred_timers',
      {
        'hours': timer.hours,
        'minutes': timer.minutes,
        'seconds': timer.seconds,
      },
    );
  }

  // drops the db (ONLY IF NECESSARY)
  Future<void> deleteAllPreferredTimers() async {
    final db = await instance.database;
    await db.delete('preferred_timers');
  }
}
