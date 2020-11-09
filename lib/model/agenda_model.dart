class AgendaModel {
  bool success;
  String message;
  List<Data> data;

  AgendaModel({this.success, this.message, this.data});

  AgendaModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    data=List<Data>.from(json["data"].map((it)=>Data.fromJson(it)));
    }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] =success;
    data['message'] = message;
    data['data'] = data != null ?
    this.data.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}

class Data {
  int id;
  int subkategoriId;
  int trainerId;
  String nama;
  int level;
  int tipe;
  String tempat;
  int durasi;
  int slot;
  String image;
  String createdAt;
  String updatedAt;
  Pivot pivot;
  List<Session> session;

  Data(
      {this.id,
      this.subkategoriId,
      this.trainerId,
      this.nama,
      this.level,
      this.tipe,
      this.tempat,
      this.durasi,
      this.slot,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.pivot,
      this.session});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subkategoriId = json['subkategori_id'];
    trainerId = json['trainer_id'];
    nama = json['nama'];
    level = json['level'];
    tipe = json['tipe'];
    tempat = json['tempat'];
    durasi = json['durasi'];
    slot = json['slot'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    if (json['session'] != null) {
      session = new List<Session>();
      json['session'].forEach((v) {
        session.add(new Session.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subkategori_id'] = this.subkategoriId;
    data['trainer_id'] = this.trainerId;
    data['nama'] = this.nama;
    data['level'] = this.level;
    data['tipe'] = this.tipe;
    data['tempat'] = this.tempat;
    data['durasi'] = this.durasi;
    data['slot'] = this.slot;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    if (this.session != null) {
      data['session'] = this.session.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  int invoiceId;
  int kelasId;

  Pivot({this.invoiceId, this.kelasId});

  Pivot.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoice_id'];
    kelasId = json['kelas_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_id'] = this.invoiceId;
    data['kelas_id'] = this.kelasId;
    return data;
  }
}

class Session {
  int id;
  int kelasId;
  String tanggal;
  int jam;
  String createdAt;
  String updatedAt;

  Session(
      {this.id,
      this.kelasId,
      this.tanggal,
      this.jam,
      this.createdAt,
      this.updatedAt});

  Session.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kelasId = json['kelas_id'];
    tanggal = json['tanggal'];
    jam = json['jam'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kelas_id'] = this.kelasId;
    data['tanggal'] = this.tanggal;
    data['jam'] = this.jam;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
