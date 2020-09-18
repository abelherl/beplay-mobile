import 'package:beplay/model/classes2.dart';

class ClassesParent {

  bool success;
  String message;
  List<Classes2> data;

	ClassesParent.fromJsonMap(Map<String, dynamic> map): 
		success = map["success"],
		message = map["message"],
		data = List<Classes2>.from(map["data"].map((it) => Classes2.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = success;
		data['message'] = message;
		data['data'] = data != null ? 
			this.data.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
