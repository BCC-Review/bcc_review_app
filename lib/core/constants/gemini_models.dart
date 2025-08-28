/// Constantes relacionadas aos modelos Gemini disponíveis.
/// 
/// Este arquivo centraliza os nomes dos modelos Gemini que podem ser
/// utilizados pela aplicação para gerar explicações.
library gemini_models;

/// Lista de modelos Gemini disponíveis para uso na aplicação.
const List<String> availableGeminiModels = [
  'gemini-2.0-flash',
  'gemini-2.0-flash-lite-001',
  'gemini-2.0-flash-thinking-exp-01-21',
  'gemini-2.5-pro-preview-03-25',
];

/// Modelo Gemini padrão utilizado pela aplicação.
const String defaultGeminiModel = 'gemini-2.0-flash-thinking-exp-01-21';