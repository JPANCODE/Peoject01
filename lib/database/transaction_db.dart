import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TransactionDB {
  //บริการฐานข้อมูล

  String? dbName; //เก็บข้อฐานข้อมูล

  //ถ้ายังไม่ถูกสร้าง => สร้าง
  //ถูกสร้างไว้แล้ว => เปิด
  TransactionDB({this.dbName});

  Future<String?> openDatabase() async {
    //หาตำแหน่งที่จะเก็บข้อมูล
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    return dbLocation;
  }
}
