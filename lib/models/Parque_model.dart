class Parque {
  final int? id;
  final String nombre;
  final String direccion;
  final double lat;
  final double lng;
  final String descripcion;

  Parque({
    this.id,
    required this.nombre,
    required this.direccion,
    required this.lat,
    required this.lng,
    required this.descripcion,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'direccion': direccion,
      'lat': lat,
      'lng': lng,
      'descripcion': descripcion,
    };
  }

  factory Parque.fromMap(Map<String, dynamic> map) {
    return Parque(
      id: map['id'],
      nombre: map['nombre'],
      direccion: map['direccion'],
      lat: map['lat'],
      lng: map['lng'],
      descripcion: map['descripcion'],
    );
  }
}

