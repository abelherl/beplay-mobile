
class Sub_category {

  final int id;
  final int kategori_id;
  final String image;
  final String nama;
  final String created_at;
  final String updated_at;

	Sub_category.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		kategori_id = map["kategori_id"],
		image = map["image"],
		nama = map["nama"],
		created_at = map["created_at"],
		updated_at = map["updated_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['kategori_id'] = kategori_id;
		data['image'] = image;
		data['nama'] = nama;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		return data;
	}
}
