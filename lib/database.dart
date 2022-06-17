import 'dart:io';
import 'dart:async';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

import 'alarm_model.dart';

class Database{
  get database => Database();

  void initDatabase () async {
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
        join(await getDatabasesPath()),
    // When the database is first created, create a table to store dogs.
        onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
    'CREATE TABLE alarms(id INTEGER PRIMARY KEY, DateTime alarm, BOOL smart)',
    );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
    );
  }

  Future<void> insertAlarm(Alarm newAlarm) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'alarms',
      newAlarm.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Alarm>> alarms() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('alarms');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Alarm(
        id: maps[i]['id'],
        smartAlarm: maps[i]['smartAlarm'],
      );
    });
  }
  Future<void> updateAlarms(Alarm alarm) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'alarms',
      alarm.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [alarm.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }



  @override
  String toString() {
    var id;
    var alarm;
    var smartAlarm;

    return 'Alarm{id: $id, alarm: $alarm, smartAlarm: $smartAlarm}';
  }

}
