class Chapters{
  int index;
  String title;
  String titleAr;
  String titleEn;
  String place;
  int count;

//<editor-fold desc="Data Methods">
  Chapters({
    required this.index,
    required this.title,
    required this.titleAr,
    required this.titleEn,
    required this.place,
    required this.count,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chapters &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          title == other.title &&
          titleAr == other.titleAr &&
          titleEn == other.titleEn &&
          place == other.place &&
          count == other.count);

  @override
  int get hashCode =>
      index.hashCode ^
      title.hashCode ^
      titleAr.hashCode ^
      titleEn.hashCode ^
      place.hashCode ^
      count.hashCode;

  @override
  String toString() {
    return 'Chapters{' +
        ' index: $index,' +
        ' title: $title,' +
        ' titleAr: $titleAr,' +
        ' titleEn: $titleEn,' +
        ' place: $place,' +
        ' count: $count,' +
        '}';
  }

  Chapters copyWith({
    int? index,
    String? title,
    String? titleAr,
    String? titleEn,
    String? place,
    int? count,
  }) {
    return Chapters(
      index: index ?? this.index,
      title: title ?? this.title,
      titleAr: titleAr ?? this.titleAr,
      titleEn: titleEn ?? this.titleEn,
      place: place ?? this.place,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': this.index,
      'title': this.title,
      'titleAr': this.titleAr,
      'titleEn': this.titleEn,
      'place': this.place,
      'count': this.count,
    };
  }

  factory Chapters.fromMap(Map<String, dynamic> map) {
    return Chapters(
      index: map['index'] as int,
      title: map['title'] as String,
      titleAr: map['titleAr'] as String,
      titleEn: map['titleEn'] as String,
      place: map['place'] as String,
      count: map['count'] as int,
    );
  }

//</editor-fold>
}