import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class User {
  int _id;
  String _lastName;
  String _firstName;
  String _mail;
  String _password;
  String _phoneNumber;
  String _address;
  String _idPost;

  User(this._id, this._firstName, this._lastName, this._mail, this._password, this._phoneNumber, this._address);

  // Convert into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'Nom': _lastName,
      'Prenom': _firstName,
      'Mail': _mail,
      'Password': _password,
      'Telephone': _phoneNumber,
      'Adresse': _address,

    };
  }

  // Define a function that inserts user into the database
  // Future<void> insertDog(User user) async {
  //   // Get a reference to the database.
  //   final Database db = await database;
  //
  //   // Insert the Dog into the correct table. You might also specify the
  //   // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //   //
  //   // In this case, replace any previous data.
  //   await db.insert(
  //     'dogs',
  //     dog.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

}