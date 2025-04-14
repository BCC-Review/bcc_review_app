import 'package:flutter_test/flutter_test.dart';
import 'package:bcc_review_app/domain/entities/user.dart';

void main() {
  group('Teste de entidade "User".', () {
    test('Usuario pode ser criado com valores padroes', () {
      final user = User(name: 'João');
      expect(user.name, 'João');
      expect(user.level, 1);
      expect(user.totalXp, 0);
      expect(user.dailySequence, 0);
      expect(user.lastDailySequenceDate, null);
    });

    test('Usuario pode ser criado com valores especificos ', () {
      final now = DateTime.now();
      final user = User(
        id: 1,
        name: 'Maria',
        level: 5,
        totalXp: 500,
        dailySequence: 3,
        lastDailySequenceDate: now,
      );
      expect(user.id, 1);
      expect(user.name, 'Maria');
      expect(user.level, 5);
      expect(user.totalXp, 500);
      expect(user.dailySequence, 3);
      expect(user.lastDailySequenceDate, now);
    });

    test('updateLevel atualiza corretamente o nivel do Usuario', () {
      final user = User(name: 'Carlos', totalXp: 150);
      user.updateLevel();
      expect(user.level, 2);

      user.totalXp = 375; // XP necessário para o nível 3 é (100 * 1.5 * 3) = 450, então fica no nível 2
      user.updateLevel();
      expect(user.level, 2);

      user.totalXp = 450;
      user.updateLevel();
      expect(user.level, 3);

      user.totalXp = 1350;
      user.updateLevel();
      expect(user.level, 4);
    });

    test('xpToNextLevel conta corretamente o XP necessario para o proximo nivel', () {
      final userLevel1 = User(name: 'Ana', level: 1);
      expect(userLevel1.xpToNextLevel(), (100 * 1.5 * 2).round()); // Nível 2

      final userLevel3 = User(name: 'Pedro', level: 3);
      expect(userLevel3.xpToNextLevel(), (100 * 1.5 * 4).round()); // Nível 4
    });

    test('xpForCurrentLevel retorna o XP correto necessario para atingir o nivel atual', () {
      final userLevel1 = User(name: 'Lucas', level: 1);
      expect(userLevel1.xpForCurrentLevel(), userLevel1.xpForLevel(1));

      final userLevel3 = User(name: 'Laura', level: 3);
      final expectedXpLevel3 = userLevel3.xpForLevel(3);
      expect(userLevel3.xpForCurrentLevel(), expectedXpLevel3);
    });

    test('xpForNextLevel retorna o XP correto necessario para atingir o proximo nivel', () {
      final userLevel1 = User(name: 'Gabriel', level: 1);
      expect(userLevel1.xpForNextLevel(), userLevel1.xpForLevel(2));

      final userLevel2 = User(name: 'Isabela', level: 2);
      final expectedXpLevel3 = userLevel2.xpForLevel(3);
      expect(userLevel2.xpForNextLevel(), expectedXpLevel3);
    });

    test('currentLevelXp retorna o XP correto acumulado dentro do nivel atual', () {
      final user = User(name: 'Matheus', level: 2);
      final baseXp = user.xpForCurrentLevel();
      user.totalXp = baseXp + 30;
      expect(user.currentLevelXp(), 30);

      final userLevel1 = User(name: 'Alice', level: 1, totalXp: 50);
      expect(userLevel1.currentLevelXp(), 50);
    });

    test('requiredXpForCurrentLevel retorna o XP correto necessario para atingir o proximo nivel', () {
      final userLevel1 = User(name: 'Enzo', level: 1);
      expect(
        userLevel1.requiredXpForCurrentLevel(),
        userLevel1.xpForLevel(2) - userLevel1.xpForLevel(1),
      );

      final userLevel2 = User(name: 'Valentina', level: 2);
      expect(
        userLevel2.requiredXpForCurrentLevel(),
        userLevel2.xpForLevel(3) - userLevel2.xpForLevel(2),
      );
    });

  });
}