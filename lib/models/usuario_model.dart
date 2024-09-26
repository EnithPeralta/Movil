import 'package:mesa_servicio_ctpi/models/storage_model.dart';

class Usuario {
  final String? id;
  final String nombre;
  final String correo;
  final String rol;
  final String telefono;
  final String? password;
  final bool estado;
  final Storage? foto;

  Usuario({
    this.id,
    required this.nombre,
    required this.correo,
    required this.rol,
    required this.telefono,
    this.password,
    this.estado = false,
    this.foto,
  });

  // Método para convertir un JSON en un objeto Usuario
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['_id'] as String?,
      nombre: json['nombre'] as String? ??
          '', // Proporciona valor predeterminado si es null
      correo: json['correo'] as String? ??
          '', // Proporciona valor predeterminado si es null
      rol: json['rol'] as String? ??
          '', // Proporciona valor predeterminado si es null
      telefono: json['telefono'] as String? ??
          '', // Proporciona valor predeterminado si es null
      password: json['password'] as String?,
      estado: json['estado'] ?? false,
      foto: Storage.fromJson(json['foto']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'correo': correo,
      'rol': rol,
      'telefono': telefono,
      'password': password,
      'estado': estado,
      'foto': foto,
    };
  }
}
