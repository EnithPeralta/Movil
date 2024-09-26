import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchUserProfile(String token) async {
  final response = await http.get(
    Uri.parse(
        'https://backendnodeproyectomesaservicio.onrender.com/api/usuarios/perfil'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body); // Decodificar la respuesta
    print(data); // Imprimir la respuesta completa
    return data['data']; // Retornar solo la parte de 'data'
  } else {
    // Manejar el error con más información
    throw Exception(
        'Failed to load user profile: ${response.statusCode} ${response.body}');
  }
}

Future<Map<String, dynamic>> fetchUser(String token, String id) async {
  final url = Uri.parse(
      'https://backendnodeproyectomesaservicio.onrender.com/api/usuarios/$id');

  // Realiza la solicitud GET
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  // Verifica el estado de la respuesta
  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    // Imprimir la respuesta completa
    print('Response data: $data'); // Añade esta línea para ver la respuesta

    // Verifica si 'data' está presente en la respuesta
    if (data.containsKey('data')) {
      return data['data'];
    } else {
      throw Exception('Data field missing in response');
    }
  } else {
    throw Exception('Failed to load user: ${response.reasonPhrase}');
  }
}
