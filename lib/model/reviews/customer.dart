
class Customer {

  int id;
  int user_id;
  String nama;
  String tanggal_lahir;
  int jenis_kelamin;
  String created_at;
  String updated_at;
  Object deleted_at;

	Customer.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		user_id = map["user_id"],
		nama = map["nama"],
		tanggal_lahir = map["tanggal_lahir"],
		jenis_kelamin = map["jenis_kelamin"],
		created_at = map["created_at"],
		updated_at = map["updated_at"],
		deleted_at = map["deleted_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['user_id'] = user_id;
		data['nama'] = nama;
		data['tanggal_lahir'] = tanggal_lahir;
		data['jenis_kelamin'] = jenis_kelamin;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		data['deleted_at'] = deleted_at;
		return data;
	}
}
