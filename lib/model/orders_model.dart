class OrdersModel {
  bool success;
  String message;
  List<Data> data;

  OrdersModel({this.success, this.message, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int customerId;
  String kode;
  String nominal;
  Null buktiPembayaran;
  int status;
  String createdAt;
  String updatedAt;
  List<Kelas> kelas;

  Data(
      {this.id,
      this.customerId,
      this.kode,
      this.nominal,
      this.buktiPembayaran,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.kelas});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    kode = json['kode'];
    nominal = json['nominal'];
    buktiPembayaran = json['bukti_pembayaran'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['kelas'] != null) {
      kelas = new List<Kelas>();
      json['kelas'].forEach((v) {
        kelas.add(new Kelas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['kode'] = this.kode;
    data['nominal'] = this.nominal;
    data['bukti_pembayaran'] = this.buktiPembayaran;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.kelas != null) {
      data['kelas'] = this.kelas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kelas {
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

  Kelas(
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
      this.pivot});

  Kelas.fromJson(Map<String, dynamic> json) {
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
