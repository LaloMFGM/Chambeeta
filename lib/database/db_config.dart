import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'dart:io' as io;
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class SQLFunctions {
  
  static Future<sql.Database> db() async {
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();

    String dbPath =
        path.join(applicationDirectory.path, "chambeeta.db");

    bool dbExists = await io.File(dbPath).exists();

    if (!dbExists) {
      // Copy from asset
      ByteData data = await rootBundle.load(path.join("db", "chambeeta.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(dbPath).writeAsBytes(bytes, flush: true);
    }

    sql.Database db = await sql.openDatabase(dbPath);

    return db;
  }



}
















// // import 'dart:io';
// // import 'package:flutter/services.dart';
// // import 'package:path/path.dart';
// // import 'package:sqflite/sqflite.dart';

// // class SQLFunctions {


// //   Future initDb() async {
// //     final dbPath = await getDatabasesPath();
// //     final path = join(dbPath, "ecp_mobile.db");

// //     final exist = await databaseExists(path);

// //     if (exist) {
// //     } else {
// //       try {
// //         await Directory(dirname(path)).create(recursive: true);
// //       } catch (e) {}
// //       ByteData data = await rootBundle.load(join("db", "ecp_mobile.db"));
// //       List<int> bytes =
// //           data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

// //       await File(path).writeAsBytes(bytes, flush: true);
// //     }

// //     await openDatabase(path);


// //   }







// // }



// import 'package:sqflite/sqflite.dart' as sql;

// class SQLFunctions {
//   // static Future<void> createTables(sql.Database database) async {
//   //   await database.execute("""CREATE TABLE IF NOT EXISTS Plants(

//   //     "id" INTEGER PRIMARY KEY NOT NULL,
//   //     "name" TEXT NOT NULL,
//   //     "nickname" TEXT,
//   //     "code" TEXT NOT NULL

//   //   )

//   //   """);

//   //   //adentro del execute van las tablas que vamos a crear
//   // }

//   static Future<sql.Database> db() async {
//     final dbdata = await sql.openDatabase("ecp_mobile.db", version: 1);
//     return dbdata;
//     // ,
//     //     onCreate: (sql.Database database, int version) async {
//     //   await createTables(database);
//     // });
//   }

//   static Future<int> updateSQlitePlants(
//       int idplant, String name, String? nickname, String code) async {
//     final db = await SQLFunctions.db();
//     final data = {
//       'id': idplant,
//       'name': name,
//       'nickname': nickname,
//       'code': code
//     };

//     final id = await db.insert('Plants', data,
//         conflictAlgorithm: sql.ConflictAlgorithm.replace);
//     return id;

//   }

//   static Future<List<Map<String, dynamic>>> getSQlitePlants() async {
//     final db = await SQLFunctions.db();

//     return db.query('Plants', columns: ['name']);
//   }



// }