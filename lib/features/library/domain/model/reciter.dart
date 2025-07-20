
class Reciter{
  String name;
  String image;
  String phone;
  String uuid;

//<editor-fold desc="Data Methods">
  Reciter({
    required this.name,
    required this.image,
    required this.phone,
    required this.uuid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reciter &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          phone == other.phone &&
          uuid == other.uuid);

  @override
  int get hashCode =>
      name.hashCode ^ image.hashCode ^ phone.hashCode ^ uuid.hashCode;

  @override
  String toString() {
    return 'Reciter{' +
        ' name: $name,' +
        ' image: $image,' +
        ' phone: $phone,' +
        ' uuid: $uuid,' +
        '}';
  }

  Reciter copyWith({
    String? name,
    String? image,
    String? phone,
    String? uuid,
  }) {
    return Reciter(
      name: name ?? this.name,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
      'phone': this.phone,
      'uuid': this.uuid,
    };
  }

  factory Reciter.fromMap(Map<String, dynamic> map) {
    return Reciter(
      name: map['name'] as String,
      image: map['image'] as String,
      phone: map['phone'] as String,
      uuid: map['uuid'] as String,
    );
  }

//</editor-fold>
}