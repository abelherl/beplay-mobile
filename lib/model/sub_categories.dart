
class Sub_categories {

  int id;
  int kategori_id;
  String images;
  String nama;
  String created_at;
  String updated_at;

	Sub_categories.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		kategori_id = map["kategori_id"],
		images = map["images"],
		nama = map["nama"],
		created_at = map["created_at"],
		updated_at = map["updated_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['kategori_id'] = kategori_id;
		data['images'] = images;
		data['nama'] = nama;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		return data;
	}
}
