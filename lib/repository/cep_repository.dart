import 'package:dio/dio.dart';
import 'package:myapp/models/cep_model.dart';

class CepRepository {
  CepRepository({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<CepModel> buscarCep(String cep) async {
    try {
      final response = await _dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data['erro'] != null) {
          throw Exception('CEP não encontrado');
        }
        return CepModel.fromJson(data);
      } else {
        throw Exception('Erro ao buscar CEP: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Erro ao buscar CEP: ${e.message}');
    } catch (e) {
      throw Exception('Erro desconhecido: $e');
    }
  }
}
