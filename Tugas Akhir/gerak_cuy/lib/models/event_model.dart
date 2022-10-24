class EventModel {
  String? userId;
  String? judul;
  String? jenis;
  int kuota;
  String? lokasi;
  String? tanggal;
  String? waktu;
  String? catatan;
  String? foto;
  String? eventId;
  List<dynamic>? userJoin;

  EventModel(
      {this.userId,
      this.judul = "",
      this.jenis = "",
      this.kuota = 0,
      this.lokasi = "",
      this.tanggal = "",
      this.waktu = "",
      this.foto = "",
      this.catatan = "",
      this.eventId = "",
      this.userJoin});

  factory EventModel.fromMap(map) {
    return EventModel(
        userId: map['userId'] as String,
        judul: map['judul'] as String,
        jenis: map['jenis'] as String,
        kuota: map['kuota'] as int,
        lokasi: map['lokasi'] as String,
        tanggal: map['tanggal'] as String,
        waktu: map['waktu'] as String,
        foto: map['foto'] as String,
        eventId: map['eventId'] as String,
        userJoin: map['userJoin'],
        catatan: map['catatan'] as String);
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'judul': judul,
      'jenis': jenis,
      'kuota': kuota,
      'lokasi': lokasi,
      'tanggal': tanggal,
      'waktu': waktu,
      'foto': foto,
      'catatan': catatan,
      'userJoin': [userJoin],
      'eventId': eventId
    };
  }
}
