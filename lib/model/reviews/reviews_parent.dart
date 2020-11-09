import 'package:beplay/model/reviews/data.dart';

class ReviewsParent {

  bool success;
  String message;
  List<Data> data;

	ReviewsParent.fromJsonMap(Map<String, dynamic> map): 
		success = map["success"],
		message = map["message"],
		data = List<Data>.from(map["data"].map((it) => Data.fromJsonMap(it))).toList();

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
