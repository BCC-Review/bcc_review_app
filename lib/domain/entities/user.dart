import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id? id;
  String name;
  int level;
  int totalXp;
  int dailySequence;

  // Constantes para cálculo de nível
  static const int baseXp = 100;
  static const double growthRate = 1.5;

  User({
    this.id,
    required this.name,
    this.level = 1,
    this.totalXp = 0,
    this.dailySequence = 0,
  });

  // Atualiza o nível com base no XP total
  void updateLevel() {
    int currentLevel = 1;
    int accumulatedXp = 0;
    int requiredXp = baseXp;

    while (accumulatedXp + requiredXp <= totalXp) {
      accumulatedXp += requiredXp;
      currentLevel++;
      requiredXp = (baseXp * (growthRate * currentLevel)).round();
    }

    level = currentLevel;
  }

  // Calcula quanto XP falta para o próximo nível
  int xpToNextLevel() {
    int currentLevel = level;
    int accumulatedXp = 0;
    int requiredXp = baseXp;

    // Calcula o XP acumulado até o nível atual
    for (int i = 0; i < currentLevel; i++) {
      accumulatedXp += requiredXp;
      requiredXp = (baseXp * (growthRate * (i + 1))).round();
    }

    // XP necessário para o próximo nível
    return accumulatedXp + requiredXp - totalXp;
  }
}
