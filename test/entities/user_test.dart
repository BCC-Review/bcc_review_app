import 'package:flutter_test/flutter_test.dart';
import 'package:bcc_review_app/domain/entities/user.dart ';

void main() {
  group('Teste de entidade "User".', () {
    test('Usuário pode ser criado com valores padrões', () {
      final user = User(name: 'João');
      expect(user.name, 'João');
      expect(user.level, 1);
      expect(user.totalXp, 0);
      expect(user.dailySequence, 0);
      expect(user.lastDailySequenceDate, null);
      expect(user.id, isNull);
    });
 /*
    test('Usuário pode ser criado com valores especificos ', () {
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

    test('updateLevel atualiza corretamente o nível do usuário', () {
      final user = User(name: 'Carlos', totalXp: 150);
      user.updateLevel();
      expect(user.level, 2);

      user.totalXp = 375; // XP necessário para o nível 3 é (100 * 1.5 * 3) = 450, então fica no nível 2
      user.updateLevel();
      expect(user.level, 2);

      user.totalXp = 450;
      user.updateLevel();
      expect(user.level, 3);

      user.totalXp = 1000;
      user.updateLevel();
      expect(user.level, 4); // (100 * 1.5 * 4) = 600, (100 * 1.5 * 5) = 750, (100 * 1.5 * 6) = 900, (100 * 1.5 * 7) = 1050
    });

    test('xpToNextLevel conta corretamente o XP necessário para o próximo nível', () {
      final userLevel1 = User(name: 'Ana', level: 1);
      expect(userLevel1.xpToNextLevel(), (100 * 1.5 * 2).round()); // Nível 2

      final userLevel3 = User(name: 'Pedro', level: 3);
      expect(userLevel3.xpToNextLevel(), (100 * 1.5 * 4).round()); // Nível 4
    });

    test('xpForLevel calcula corretamente o XP total necessário para chegar ao próximo nível', () {
      final user = User(name: 'Sofia');
      expect(user.xpForLevel(1), 0);
      expect(user.xpForLevel(2), (100 * 1.5 * 2).round());
      expect(user.xpForLevel(3), (100 * 1.5 * 2).round() + (100 * 1.5 * 3).round());
      expect(user.xpForLevel(5), (100 * 1.5 * 2).round() + (100 * 1.5 * 3).round() + (100 * 1.5 * 4).round() + (100 * 1.5 * 5).round());
    });

    test('xpForCurrentLevel retorna o XP correto necessário para atingir o nível atual', () {
      final userLevel1 = User(name: 'Lucas', level: 1);
      expect(userLevel1.xpForCurrentLevel(), 0);

      final userLevel3 = User(name: 'Laura', level: 3);
      final expectedXpLevel3 = (100 * 1.5 * 2).round() + (100 * 1.5 * 3).round();
      expect(userLevel3.xpForCurrentLevel(), expectedXpLevel3);
    });

    test('xpForNextLevel retorna o XP correto necessário para atingir o próximo nível', () {
      final userLevel1 = User(name: 'Gabriel', level: 1);
      expect(userLevel1.xpForNextLevel(), (100 * 1.5 * 2).round());

      final userLevel2 = User(name: 'Isabela', level: 2);
      final expectedXpLevel3 = (100 * 1.5 * 2).round() + (100 * 1.5 * 3).round();
      expect(userLevel2.xpForNextLevel(), expectedXpLevel3);
    });

    test('currentLevelXp retorna o XP correto acumulado dentro do nível atual', () {
      final userLevel2WithExtraXp = User(name: 'Matheus', level: 2, totalXp: (100 * 1.5 * 2).round() + 30);
      expect(userLevel2WithExtraXp.currentLevelXp(), 30);

      final userLevel1 = User(name: 'Alice', level: 1, totalXp: 50);
      expect(userLevel1.currentLevelXp(), 50);
    });

    test('requiredXpForCurrentLevel retorna o XP correto necessário para atingir o próximo nível do atual', () {
      final userLevel1 = User(name: 'Enzo', level: 1);
      expect(userLevel1.requiredXpForCurrentLevel(), (100 * 1.5 * 2).round() - 0);

      final userLevel2 = User(name: 'Valentina', level: 2);
      final xpForLevel2 = (100 * 1.5 * 2).round();
      final xpForLevel3 = (100 * 1.5 * 2).round() + (100 * 1.5 * 3).round();
      expect(userLevel2.requiredXpForCurrentLevel(), xpForLevel3 - xpForLevel2);
    });

  */
  });
}