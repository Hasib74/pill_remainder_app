import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:remainder_flutter/core/error/app_error.dart';
import 'package:remainder_flutter/data/db/isarDB/dbOparation/isar_database_setup.dart';
import 'package:remainder_flutter/data/db/isarDB/dbSchema/remainder.dart';

class RemainderService extends IsarService {
  RemainderService() : super();

  addRemainder(Remainder remainder) async {
    // Add remainder to the database
    final isar = await db;

    var res = await isar.writeTxn(() => isar.remainders.put(remainder));

    print(res);

    return true;
  }

  updateRemainder(Remainder remainder) async {
    // Update remainder in the database

    final isar = await db;

    var res = await isar.writeTxnSync(() => isar.remainders.put(remainder));

    print(res);
  }

  deleteRemainder(Remainder remainder) async {
    // Delete remainder from the database

    final isar = await db;

    var res =
        await isar.writeTxnSync(() => isar.remainders.delete(remainder.id));

    print(res);
  }

  Future<Either<AppError, List<Remainder>>> getAllRemainder() async {
    // Get all remainders from the database

    try {
      final isar = await db;

      var remainderValue = await isar.remainders.where().findAll();

      //  print("Remainder Value  is : $remainderValue");
      return right(remainderValue);
    } catch (e) {
      return left(AppError(e.toString()));
    }
  }
}
