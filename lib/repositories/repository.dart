import 'package:sqflite/sqflite.dart';
import 'package:todolist/repositories/database_connection.dart';

class Repository{
   late DatabaseConnection _databaseConnection;

   Repository(){
     _databaseConnection = DatabaseConnection();
   }

    static Database? _database;

  // Check if database is exist or not
   Future<Database?> get database async {
     if(_database != null) return _database;
     _database = await _databaseConnection.setDatabase();
     return _database;
   }

   // Inserting data to table
   inserData(table, data) async{
     var connection = await database;
     return await connection!.insert(table, data);
   }

   readData(table) async {
     var connection = await database;
     return await connection!.query(table);
   }

  // Read data from table by Id
  readDataById(table, itemId) async{
    var connection = await database;
    return await connection!.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  // Update data from table
  updateData(table, data) async{
    var connection = await database;
    return await connection!.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  // Delete data from able
  deleteDate(table, itemId) async{
    var connection = await database;
    return await connection!.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

  // Read data from table by column name
  readDataByColumnName(table, columnName, columnValue) async {
    var connection = await database;
    return await connection!.query(table, where:'$columnName=?', whereArgs: [columnValue]);
  }
}