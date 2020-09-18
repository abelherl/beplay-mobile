
import 'package:beplay/model/reviews/customer.dart';
import 'package:beplay/model/reviews/work_out_class.dart';

class Data {

  int id;
  int customer_id;
  int kelas_id;
  int rating;
  String text;
  Object created_at;
  Object updated_at;
  Customer customer;
  Work_out_class work_out_class;

	Data.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		customer_id = map["customer_id"],
		kelas_id = map["kelas_id"],
		rating = map["rating"],
		text = map["text"],
		created_at = map["created_at"],
		updated_at = map["updated_at"],
		customer = Customer.fromJsonMap(map["customer"]),
		work_out_class = Work_out_class.fromJsonMap(map["work_out_class"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['customer_id'] = customer_id;
		data['kelas_id'] = kelas_id;
		data['rating'] = rating;
		data['text'] = text;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		data['customer'] = customer == null ? null : customer.toJson();
		data['work_out_class'] = work_out_class == null ? null : work_out_class.toJson();
		return data;
	}
}
