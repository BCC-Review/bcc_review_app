import 'package:bcc_review_app/domain/entities/question.dart';
import 'seeds/subjects/1/calculo_para_computacao_seed.dart';
import 'seeds/subjects/6/computacao_grafica_seed.dart';
import 'seeds/subjects/2/estruturas_de_dados_seed.dart';
import 'seeds/subjects/1/geometria_analitica_seed.dart';
import 'seeds/subjects/1/introducao_a_computacao_seed.dart';
import 'seeds/subjects/1/introducao_a_programacao_seed.dart'; // Note: Variable name inside might have a typo
import 'seeds/subjects/1/logica_matematica_seed.dart';
import 'seeds/subjects/4/paradigmas_de_linguagens_de_programacao_seed.dart';
import 'seeds/subjects/5/redes_de_computadores_seed.dart';
import 'seeds/subjects/3/sistemas_digitais_seed.dart';

// Estrutura de dados centralizada para o seeding inicial do banco de dados.
// Os dados de cada disciplina são importados de arquivos separados.

final List<Map<String, dynamic>> seedSubjectsData = [
  introducaoAProramacaoSeedData,
  logicaMatematicaSeedData,
  geometriaAnaliticaSeedData,
  introducaoAComputacaoSeedData,
  calculoParaComputacaoSeedData,
  sistemasDigitaisSeedData,
  paradigmasDeLinguagensDeProgramacaoSeedData,
  redesDeComputadoresSeedData,
  computacaoGraficaSeedData,
  estruturasDeDadosSeedData,
];
