class Surah{
  int surah;
  int ayah;
  String english;
  String twi;
  String arabic;

//<editor-fold desc="Data Methods">
  Surah({
    required this.surah,
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
          surah == other.surah &&
          ayah == other.ayah &&
          english == other.english &&
          twi == other.twi &&
          arabic == other.arabic);

  @override
  int get hashCode =>
      surah.hashCode ^
      ayah.hashCode ^
      english.hashCode ^
      twi.hashCode ^
      arabic.hashCode;

  @override
  String toString() {
    return 'Surah{' +
        ' surah: $surah,' +
        ' ayah: $ayah,' +
        ' english: $english,' +
        ' twi: $twi,' +
        ' arabic: $arabic,' +
        '}';
  }

  Surah copyWith({
    int? surah,
    int? ayah,
    String? english,
    String? twi,
    String? arabic,
  }) {
    return Surah(
      surah: surah ?? this.surah,
      ayah: ayah ?? this.ayah,
      english: english ?? this.english,
      twi: twi ?? this.twi,
      arabic: arabic ?? this.arabic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'surah': this.surah,
      'ayah': this.ayah,
      'english': this.english,
      'twi': this.twi,
      'arabic': this.arabic,
    };
  }

  factory Surah.fromMap(Map<String, dynamic> map) {
    return Surah(
      surah: map['surah'] as int,
      ayah: map['ayah'] as int,
      english: map['english'] as String,
      twi: map['twi'] as String,
      arabic: map['arabic'] as String,
    );
  }

//</editor-fold>
}
