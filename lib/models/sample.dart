class SampleFields {
  static final String promiseAns = 'promiseAns';
  static final String planAns = 'planAns';
  static final String createAt = 'createAt';
}

class Sample {
  static String tableName = 'sample';
  List<String>? promiseAns = [];
  List<String>? planAns = [];
  DateTime createAt;

  Sample({
    this.promiseAns,
    this.planAns,
    required this.createAt,
  });

  Map<String, dynamic> toJson() {
    return {
      SampleFields.promiseAns: promiseAns,
      SampleFields.planAns: planAns,
      SampleFields.createAt: createAt.toIso8601String(),
    };
  }

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      promiseAns: json[SampleFields.promiseAns] == null
          ? null
          : json[SampleFields.promiseAns] as List<String>,
      planAns: json[SampleFields.planAns] == null
          ? null
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
