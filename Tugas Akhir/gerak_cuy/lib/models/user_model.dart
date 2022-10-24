class UserModel {
  String? uid;
  String? email;
  String? fullName;
  String? foto =
      "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1320751178?k=20&m=1320751178&s=612x612&w=0&h=qBg0zl3GQvll4dI5m0VDidziZN5VWnghNQ2rt-6aln0=";
  String? nomor;
  String? alamat;
  // List<dynamic>? joinedEvents;

  UserModel(
      {this.uid,
      this.email,
      this.fullName,
      this.foto,
      this.nomor,
      // this.joinedEvents,
      this.alamat});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'] as String,
        email: map['email'] as String,
        fullName: map['fullName'],
        foto: map['foto'],
        alamat: map['alamat'],
        // joinedEvents: map['joinedEvents'],
        nomor: map['nomor']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'foto': foto,
      'nomor': nomor,
      'alamat': alamat,
      // 'events': [joinedEvents]
    };
  }
}
