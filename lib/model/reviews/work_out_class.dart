
class Work_out_class {

  int id;
  int subkategori_id;
  int trainer_id;
  String nama;
  int level;
  int tipe;
  String tempat;
  int durasi;
  int slot;
  String image;
  String created_at;
  String updated_at;

	Work_out_class.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		subkategori_id = map["subkategori_id"],
		trainer_id = map["trainer_id"],
		nama = map["nama"],
		level = map["level"],
		tipe = map["tipe"],
		tempat = map["tempat"],
		durasi = map["durasi"],
		slot = map["slot"],
		image = map["image"],
		created_at = map["created_at"],
		updated_at = map["updated_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['subkategori_id'] = subkategori_id;
		data['trainer_id'] = trainer_id;
		data['nama'] = nama;
		data['level'] = level;
		data['tipe'] = tipe;
		data['tempat'] = tempat;
		data['durasi'] = durasi;
		data['slot'] = slot;
		data['image'] = image;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		return data;
	}
}
