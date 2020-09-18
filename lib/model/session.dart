
class Session {

  final int id;
  final int kelas_id;
  final String tanggal;
  final int jam;
  final String created_at;
  final String updated_at;

	Session.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		kelas_id = map["kelas_id"],
		tanggal = map["tanggal"],
		jam = map["jam"],
		created_at = map["created_at"],
		updated_at = map["updated_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['kelas_id'] = kelas_id;
		data['tanggal'] = tanggal;
		data['jam'] = jam;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		return data;
	}
}
