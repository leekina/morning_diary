class SampleFields {
  static final String id = '_id';
  static final String promiseAns0 = 'promiseAns0';
  static final String promiseAns1 = 'promiseAns1';
  static final String promiseAns2 = 'promiseAns2';
  static final String createAt = 'createAt';
}

class Sample {
  static String tableName = 'sample3';
  int? id;
  String? promiseAns0;
  String? promiseAns1;
  String? promiseAns2;
  DateTime createAt; //저장날짜

  Sample({
    this.id,
    this.promiseAns0,
    this.promiseAns1,
    this.promiseAns2,
    required this.createAt,
  });

  //json형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      SampleFields.id: id,
      SampleFields.promiseAns0: promiseAns0,
      SampleFields.promiseAns1: promiseAns1,
      SampleFields.promiseAns2: promiseAns2,
      SampleFields.createAt: createAt.toIso8601String(),
    };
  }

  //json -> 클래스 형식으로 변환
  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      id: json[SampleFields.id] as int?,
      promiseAns0: json[SampleFields.promiseAns0] == null
          ? ''
          : json[SampleFields.promiseAns0] as String,
      promiseAns1: json[SampleFields.promiseAns1] == null
          ? ''
          : json[SampleFields.promiseAns1] as String,
      promiseAns2: json[SampleFields.promiseAns2] == null
          ? ''
          : json[SampleFields.promiseAns2] as String,
      createAt: json[SampleFields.createAt] == null
          ? DateTime.now()
          : DateTime.parse(json[SampleFields.createAt] as String),
    );
  }
  Sample clone({
    int? id,
    List<String>? promiseAns,
    List<String>? planAns,
    DateTime? createAt,
  }) {
    return Sample(
      id: id ?? this.id,
      promiseAns0: promiseAns0 ?? promiseAns0,
      promiseAns1: promiseAns1 ?? promiseAns1,
      promiseAns2: promiseAns2 ?? promiseAns2,
      createAt: createAt ?? this.createAt,
    );
  }
}
