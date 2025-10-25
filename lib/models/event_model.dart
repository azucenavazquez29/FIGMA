class Evento {
  final int? id;
  final int parqueId; // clave foránea
  final String titulo;
  final String fecha; // yyyy-MM-dd
  final String descripcion;

  Evento({
    this.id,
    required this.parqueId,
    required this.titulo,
    required this.fecha,
    required this.descripcion,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parque_id': parqueId,
      'titulo': titulo,
      'fecha': fecha,
      'descripcion': descripcion,
    };
  }

  factory Evento.fromMap(Map<String, dynamic> map) {
    return Evento(
      id: map['id'],
      parqueId: map['parque_id'],
      titulo: map['titulo'],
      fecha: map['fecha'],
      descripcion: map['descripcion'],
    );
  }
}
