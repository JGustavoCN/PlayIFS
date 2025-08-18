import '../../data/models/shared/api_validation_error.dart'; // Importa o seu DTO de erro

/// Exceção lançada quando a API retorna um erro de validação (HTTP 422).
/// Contém o objeto [errorDetails] com a estrutura completa do erro de validação.
class ValidationException implements Exception {

  ValidationException(this.errorDetails);
  // O campo agora é fortemente tipado com o seu DTO ApiValidationError.
  final ApiValidationError errorDetails;

  // A mensagem de erro principal pode ser extraída do DTO.
  @override
  String toString() => errorDetails.error;
}

/// Exceção genérica para outros erros da API que não são de validação.
class ApiException implements Exception {

  ApiException(this.message, {this.statusCode});
  final String message;
  final int? statusCode;

  @override
  String toString() => 'Erro da API (Status: $statusCode): $message';
}