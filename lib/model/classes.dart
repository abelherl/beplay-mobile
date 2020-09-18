import 'package:beplay/model/sub_categories.dart';
import 'package:beplay/model/trainer.dart';

class Classes {

  final int id;
  final int subkategoriId;
  final int trainerId;
  final int level;
  final int tipe;
  final String images;
  final String nama;
  final String tempat;
  final int durasi;
  final int slot;
  final String createdAt;
  final String updatedAt;
  final Trainer trainer;
  final Sub_categories subCategories;

	Classes.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		subkategoriId = map["subkategori_id"],
		trainerId = map["trainer_id"],
		level = map["level"],
		tipe = map["tipe"],
		images = map["images"],
		nama = map["nama"],
		tempat = map["tempat"],
		durasi = map["durasi"],
		slot = map["slot"],
		createdAt = map["created_at"],
		updatedAt = map["updated_at"],
		trainer = Trainer.fromJsonMap(map["trainer"]),
		subCategories = Sub_categories.fromJsonMap(map["sub_categories"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['subkategori_id'] = subkategoriId;
		data['trainer_id'] = trainerId;
		data['level'] = level;
		data['tipe'] = tipe;
		data['images'] = images;
		data['nama'] = nama;
		data['tempat'] = tempat;
		data['durasi'] = durasi;
		data['slot'] = slot;
		data['created_at'] = createdAt;
		data['updated_at'] = updatedAt;
		data['trainer'] = trainer == null ? null : trainer.toJson();
		data['sub_categories'] = subCategories == null ? null : subCategories.toJson();
		return data;
	}
}
