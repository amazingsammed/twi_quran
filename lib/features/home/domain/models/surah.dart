class Surah{
  int sura;
  int ayah;
  String english;
  String twi;
  String arabic;
  String arabic2;
  int bookmark;

//<editor-fold desc="Data Methods">
  Surah({
    required this.sura,
    required this.ayah,
    required this.english,
    required this.twi,
    required this.arabic,
    required this.arabic2,
    required this.bookmark,
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
          arabic == other.arabic &&
          arabic2 == other.arabic2 &&
          bookmark == other.bookmark);

  @override
  int get hashCode =>
      sura.hashCode ^
      ayah.hashCode ^
      english.hashCode ^
      twi.hashCode ^
      arabic.hashCode ^
      arabic2.hashCode ^
      bookmark.hashCode;

  @override
  String toString() {
    return 'Surah{' +
        ' sura: $sura,' +
        ' ayah: $ayah,' +
        ' english: $english,' +
        ' twi: $twi,' +
        ' arabic: $arabic,' +
        ' arabic2: $arabic2,' +
        ' bookmark: $bookmark,' +
        '}';
  }

  Surah copyWith({
    int? sura,
    int? ayah,
    String? english,
    String? twi,
    String? arabic,
    String? arabic2,
    int? bookmark,
  }) {
    return Surah(
      sura: sura ?? this.sura,
      ayah: ayah ?? this.ayah,
      english: english ?? this.english,
      twi: twi ?? this.twi,
      arabic: arabic ?? this.arabic,
      arabic2: arabic2 ?? this.arabic2,
      bookmark: bookmark ?? this.bookmark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sura': this.sura,
      'ayah': this.ayah,
      'english': this.english,
      'twi': this.twi,
      'arabic': this.arabic,
      'arabic2': this.arabic2,
      'bookmark': this.bookmark,
    };
  }

  factory Surah.fromMap(Map<String, dynamic> map) {
    return Surah(
      sura: map['sura'] as int,
      ayah: map['ayah'] as int,
      english: map['english'] as String,
      twi: map['twi'] as String,
      arabic: map['arabic'] as String,
      arabic2: map['arabic2'] as String,
      bookmark: map['bookmark'] as int,
    );
  }

//</editor-fold>
}
