import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:isar/isar.dart';

part 'subject.g.dart';

@Collection()
class Subject {
  Id? id;
  String name;
  int period;
  String description;
  String icon;

  final modules = IsarLinks<Module>();

  Subject({
    this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.period,
  });
}
