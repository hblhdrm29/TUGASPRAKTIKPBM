class Halu {
  late int? id;
  late String kegiatan;
  late String waktu;
  late String dimana;
  late String ngapain;

  Halu({this.id,required this.kegiatan,required this.waktu,required this.dimana,required this.ngapain,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kegiatan': kegiatan,
      'waktu': waktu,
      'dimana': dimana,
      'ngapain': ngapain,
    };
  }

  Halu.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    kegiatan = map['kegiatan'];
    waktu = map['waktu'];
    dimana = map['dimana'];
    ngapain = map['ngapain'];
  }
}