//데이터베이스의 CRUD 담당

import 'package:morning_diary/models/sample.dart';
import 'package:morning_diary/repository/sql_database.dart';

class SqlSampleCrudRepository {
  //DB 생성
  static Future<int> create(Sample sample) async {
    var db = await SqlDataBase().database;
    var id = await db.insert(Sample.tableName, sample.toJson());
    return id;
  }

  //디비 리스트로 변경후 전체 리턴
  static Future<List<Sample>> getList() async {
    var db = await SqlDataBase().database;
    var result = await db.query(Sample.tableName, columns: [
      SampleFields.id,
      SampleFields.promiseAns0,
      SampleFields.promiseAns1,
      SampleFields.promiseAns2,
      SampleFields.createAt,
    ]);
    print(result);

    //반복가능한 집단을 리스트로 만들어주는 과정임
    //원래 리턴값은 샘플이 모인 iterable객체가 결과값으로 나왔지만
    //toList 를 통해 리스트로 바꿔줌
    return result.map(
      (data) {
        return Sample.fromJson(data);
      },
    ).toList();
  }

  // 아이디로 구분해서 하나만 리턴
  static Future<Sample?> getSampleOne(String id) async {
    var db = await SqlDataBase().database;
    var result = await db.query(Sample.tableName,
        columns: [
          SampleFields.id,
          SampleFields.promiseAns0,
          SampleFields.promiseAns1,
          SampleFields.promiseAns2,
          SampleFields.createAt,
        ],
        //이렇게 하면 패킷띁어서 해킹가능
        //where: '${SampleFields.id} = $id');
        where: '${SampleFields.id} = ?',
        whereArgs: [id]);

    //객체 리스트로 변경
    var list = result.map(
      (data) {
        return Sample.fromJson(data);
      },
    ).toList();

    //리스트가 널 값이 아니라면 반환
    if (list.isNotEmpty) {
      return list.first;
    } else {
      return null;
    }
  }

  //업데이트 함수
  static Future<int> update(Sample sample) async {
    var db = await SqlDataBase().database;
    return await db.update(
      Sample.tableName,
      sample.toJson(),
      where: '${SampleFields.id} = ?',
      whereArgs: [sample.id],
    );
  }

  //삭제
  static Future<int> delete(int id) async {
    var db = await SqlDataBase().database;
    return await db.delete(
      Sample.tableName,
      where: '${SampleFields.id} = ?',
      whereArgs: [id],
    );
  }
}
