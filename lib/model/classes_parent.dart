import 'package:beplay/model/classes.dart';

class ClassesParent {

  bool success;
  String message;
  List<Classes> data;

	ClassesParent.fromJsonMap(Map<String, dynamic> map): 
		success = map["success"],
		message = map["message"],
		data = List<Classes>.from(map["data"].map((it) => Classes.fromJsonMap(it)));

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
