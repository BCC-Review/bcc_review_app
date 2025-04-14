import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id? id;
  String name;
  int level;
  int totalXp;
  int dailySequence;
  DateTime? lastDailySequenceDate;

  // Constantes para cálculo de nível
  static const int baseXp = 100;
  static const double growthRate = 1.5;

  User({
    this.id,
    required this.name,
    this.level = 1,
    this.totalXp = 0,
    this.dailySequence = 0,
    this.lastDailySequenceDate,
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
    int nextLevelXp = xpForLevel(level + 1);
    return nextLevelXp - totalXp;
  }

  // Calcula o XP total necessário para atingir um determinado nível
  int xpForLevel(int targetLevel) {
    if (targetLevel <= 1) {
      return 0; // Nível 1 não requer XP prévio
    }
    int accumulatedXp = 0;
    int requiredXp = baseXp;
    for (int i = 1; i < targetLevel; i++) {
      accumulatedXp += requiredXp;
      requiredXp = (baseXp * (growthRate * (i + 1))).round();
    }
    return accumulatedXp;
  }

  // Retorna o XP necessário para atingir o nível atual
  int xpForCurrentLevel() {
    return xpForLevel(level);
  }

  // Retorna o XP necessário para atingir o próximo nível
  int xpForNextLevel() {
    return xpForLevel(level + 1);
  }

  // Retorna o XP acumulado dentro do nível atual
  int currentLevelXp() {
    return totalXp - xpForCurrentLevel();
  }

  // Retorna o XP total necessário para passar do nível atual para o próximo
  int requiredXpForCurrentLevel() {
    return xpForNextLevel() - xpForCurrentLevel();
  }
}
