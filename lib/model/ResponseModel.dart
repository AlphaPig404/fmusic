class ResponseModel{
  final int code;
  final Map<String, dynamic> data;
  final String message;
  final int subcide;

  ResponseModel({this.code, this.data, this.message, this.subcide});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      code: json['code'],
      data: json['data'],
      message: json['message'],
      subcide: json['subcide']
    );
  }
}


