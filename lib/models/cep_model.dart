class CepModel {
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.estado,
    required this.localidade,
    required this.uf,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) {
    CepModel cepModel = CepModel(
      cep: json['cep'] as String,
      logradouro: json['logradouro'] as String,
      complemento: json['complemento'] as String,
      bairro: json['bairro'] as String,
      estado: json['estado'] as String,
      localidade: json['localidade'] as String,
      uf: json['uf'] as String,
    );
    return cepModel;
  }

  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String estado;
  final String localidade;
  final String uf;
}
