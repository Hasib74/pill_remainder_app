import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../dbSchema/remainder.dart';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [RemainderSchema], // Here we will add a schema's
        directory: dir.path,
        inspector: true,
      );

      print("Isar Instance : == > ${isar}");

      return isar;
    }

    return Future.value(Isar.getInstance());
  }
}
