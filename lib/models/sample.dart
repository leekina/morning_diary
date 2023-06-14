class SampleFields {
  static final String promiseAns = 'promiseAns';
  static final String planAns = 'planAns';
  static final String createAt = 'createAt';
}

class Sample {
  static String tableName = 'sample';
  List<dynamic> promiseAns = []; // 다짐
  List<String>? planAns = []; // 계획
  DateTime createAt; //저장날짜

  Sample({
    required this.promiseAns,
    this.planAns,
    required this.createAt,
  });

  //json형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      SampleFields.promiseAns: promiseAns,
      SampleFields.planAns: planAns,
      SampleFields.createAt: createAt.toIso8601String(),
    };
  }

  //json -> 클래스 형식으로 변환
  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      promiseAns: json[SampleFields.promiseAns] == null
          ? []
          : json[SampleFields.promiseAns] as List<dynamic>,
      planAns: json[SampleFields.planAns] == null
          ? []
          : json[SampleFields.planAns] as List<String>,
      createAt: json[SampleFields.createAt] == null
          ? DateTime.now()
          : DateTime.parse(json[SampleFields.createAt] as String),
    );
  }
  Sample clone({
    List<String>? promiseAns,
    List<String>? planAns,
    DateTime? createAt,
  }) {
    return Sample(
      promiseAns: promiseAns ?? this.promiseAns,
      planAns: planAns ?? this.planAns,
      createAt: createAt ?? this.createAt,
    );
  }
}
