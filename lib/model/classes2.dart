import 'package:beplay/model/session.dart';
import 'package:beplay/model/sub_category.dart';
import 'package:beplay/model/trainer.dart';

class Classes2 {

  final int id;
  final int subkategori_id;
  final int trainer_id;
  final String nama;
  final int level;
  final int tipe;
  final String tempat;
  final int durasi;
  final int slot;
  final String image;
  final String created_at;
  final String updated_at;
  final Trainer trainer;
  final Sub_category sub_category;
  final List<Session> session;

	Classes2.fromJsonMap(Map<String, dynamic> map): 
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
		updated_at = map["updated_at"],
		trainer = Trainer.fromJsonMap(map["trainer"]),
		sub_category = Sub_category.fromJsonMap(map["sub_category"]),
		session = List<Session>.from(map["session"].map((it) => Session.fromJsonMap(it)));

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
		data['trainer'] = trainer == null ? null : trainer.toJson();
		data['sub_category'] = sub_category == null ? null : sub_category.toJson();
		data['session'] = session != null ? 
			this.session.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
