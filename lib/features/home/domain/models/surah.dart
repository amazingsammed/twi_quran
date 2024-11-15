class Surah{
  int sura;
  int ayah;
  String english;
  String twi;
  String arabic;

//<editor-fold desc="Data Methods">
  Surah({
    required this.sura,
    required this.ayah,
    required this.english,
    required this.twi,
    required this.arabic,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Surah &&
          runtimeType == other.runtimeType &&
          sura == other.sura &&
          ayah == other.ayah &&
          english == other.english &&
          twi == other.twi &&
          arabic == other.arabic);

  @override
  int get hashCode =>
      sura.hashCode ^
      ayah.hashCode ^
      english.hashCode ^
      twi.hashCode ^
      arabic.hashCode;

  @override
  String toString() {
    return 'Surah{' +
        ' sura: $sura,' +
        ' ayah: $ayah,' +
        ' english: $english,' +
        ' twi: $twi,' +
        ' arabic: $arabic,' +
        '}';
  }

  Surah copyWith({
    int? sura,
    int? ayah,
    String? english,
    String? twi,
    String? arabic,
  }) {
    return Surah(
      sura: sura ?? this.sura,
      ayah: ayah ?? this.ayah,
      english: english ?? this.english,
      twi: twi ?? this.twi,
      arabic: arabic ?? this.arabic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sura': this.sura,
      'ayah': this.ayah,
      'english': this.english,
      'twi': this.twi,
      'arabic': this.arabic,
    };
  }

  factory Surah.fromMap(Map<String, dynamic> map) {
    return Surah(
      sura: map['sura'] as int,
      ayah: map['ayah'] as int,
      english: map['english'] as String,
      twi: map['twi'] as String,
      arabic: map['arabic'] as String,
    );
  }

//</editor-fold>
}
