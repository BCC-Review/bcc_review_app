// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMultipleChoiceCollection on Isar {
  IsarCollection<MultipleChoice> get multipleChoices => this.collection();
}

const MultipleChoiceSchema = CollectionSchema(
  name: r'MultipleChoice',
  id: -7581347634098164831,
  properties: {
    r'alternatives': PropertySchema(
      id: 0,
      name: r'alternatives',
      type: IsarType.stringList,
    ),
    r'correctAnswerIndex': PropertySchema(
      id: 1,
      name: r'correctAnswerIndex',
      type: IsarType.long,
    ),
    r'isOfficial': PropertySchema(
      id: 2,
      name: r'isOfficial',
      type: IsarType.bool,
    ),
    r'isResponded': PropertySchema(
      id: 3,
      name: r'isResponded',
      type: IsarType.bool,
    ),
    r'questionType': PropertySchema(
      id: 4,
      name: r'questionType',
      type: IsarType.string,
      enumMap: _MultipleChoicequestionTypeEnumValueMap,
    ),
    r'statement': PropertySchema(
      id: 5,
      name: r'statement',
      type: IsarType.string,
    ),
    r'xpInitial': PropertySchema(
      id: 6,
      name: r'xpInitial',
      type: IsarType.long,
    ),
    r'xpReview': PropertySchema(
      id: 7,
      name: r'xpReview',
      type: IsarType.long,
    )
  },
  estimateSize: _multipleChoiceEstimateSize,
  serialize: _multipleChoiceSerialize,
  deserialize: _multipleChoiceDeserialize,
  deserializeProp: _multipleChoiceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'module': LinkSchema(
      id: 1028915968444571087,
      name: r'module',
      target: r'Module',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _multipleChoiceGetId,
  getLinks: _multipleChoiceGetLinks,
  attach: _multipleChoiceAttach,
  version: '3.1.0+1',
);

int _multipleChoiceEstimateSize(
  MultipleChoice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alternatives.length * 3;
  {
    for (var i = 0; i < object.alternatives.length; i++) {
      final value = object.alternatives[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.questionType.name.length * 3;
  bytesCount += 3 + object.statement.length * 3;
  return bytesCount;
}

void _multipleChoiceSerialize(
  MultipleChoice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.alternatives);
  writer.writeLong(offsets[1], object.correctAnswerIndex);
  writer.writeBool(offsets[2], object.isOfficial);
  writer.writeBool(offsets[3], object.isResponded);
  writer.writeString(offsets[4], object.questionType.name);
  writer.writeString(offsets[5], object.statement);
  writer.writeLong(offsets[6], object.xpInitial);
  writer.writeLong(offsets[7], object.xpReview);
}

MultipleChoice _multipleChoiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MultipleChoice(
    alternatives: reader.readStringList(offsets[0]) ?? [],
    correctAnswerIndex: reader.readLong(offsets[1]),
    isOfficial: reader.readBool(offsets[2]),
    statement: reader.readString(offsets[5]),
    xpInitial: reader.readLong(offsets[6]),
    xpReview: reader.readLong(offsets[7]),
  );
  object.id = id;
  object.isResponded = reader.readBool(offsets[3]);
  object.questionType = _MultipleChoicequestionTypeValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      QuestionType.multipleChoice;
  return object;
}

P _multipleChoiceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_MultipleChoicequestionTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          QuestionType.multipleChoice) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MultipleChoicequestionTypeEnumValueMap = {
  r'multipleChoice': r'multipleChoice',
};
const _MultipleChoicequestionTypeValueEnumMap = {
  r'multipleChoice': QuestionType.multipleChoice,
};

Id _multipleChoiceGetId(MultipleChoice object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _multipleChoiceGetLinks(MultipleChoice object) {
  return [object.module];
}

void _multipleChoiceAttach(
    IsarCollection<dynamic> col, Id id, MultipleChoice object) {
  object.id = id;
  object.module.attach(col, col.isar.collection<Module>(), r'module', id);
}

extension MultipleChoiceQueryWhereSort
    on QueryBuilder<MultipleChoice, MultipleChoice, QWhere> {
  QueryBuilder<MultipleChoice, MultipleChoice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MultipleChoiceQueryWhere
    on QueryBuilder<MultipleChoice, MultipleChoice, QWhereClause> {
  QueryBuilder<MultipleChoice, MultipleChoice, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MultipleChoiceQueryFilter
    on QueryBuilder<MultipleChoice, MultipleChoice, QFilterCondition> {
  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternatives',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternatives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternatives',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternatives',
        value: '',
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternatives',
        value: '',
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternatives',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternatives',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternatives',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternatives',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternatives',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      alternativesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'alternatives',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      correctAnswerIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      correctAnswerIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      correctAnswerIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswerIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      correctAnswerIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswerIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      isOfficialEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOfficial',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      isRespondedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isResponded',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeEqualTo(
    QuestionType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeGreaterThan(
    QuestionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeLessThan(
    QuestionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeBetween(
    QuestionType lower,
    QuestionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionType',
        value: '',
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      questionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionType',
        value: '',
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statement',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statement',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statement',
        value: '',
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      statementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statement',
        value: '',
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      xpInitialEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xpInitial',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      xpInitialGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xpInitial',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      xpInitialLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xpInitial',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      xpInitialBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xpInitial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      xpReviewEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xpReview',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      xpReviewGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xpReview',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      xpReviewLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xpReview',
        value: value,
      ));
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      xpReviewBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xpReview',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MultipleChoiceQueryObject
    on QueryBuilder<MultipleChoice, MultipleChoice, QFilterCondition> {}

extension MultipleChoiceQueryLinks
    on QueryBuilder<MultipleChoice, MultipleChoice, QFilterCondition> {
  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition> module(
      FilterQuery<Module> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'module');
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterFilterCondition>
      moduleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'module', 0, true, 0, true);
    });
  }
}

extension MultipleChoiceQuerySortBy
    on QueryBuilder<MultipleChoice, MultipleChoice, QSortBy> {
  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByCorrectAnswerIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswerIndex', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByCorrectAnswerIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswerIndex', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByIsOfficial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOfficial', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByIsOfficialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOfficial', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByIsResponded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResponded', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByIsRespondedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResponded', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByQuestionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionType', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByQuestionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionType', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy> sortByStatement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statement', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByStatementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statement', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy> sortByXpInitial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpInitial', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByXpInitialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpInitial', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy> sortByXpReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpReview', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      sortByXpReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpReview', Sort.desc);
    });
  }
}

extension MultipleChoiceQuerySortThenBy
    on QueryBuilder<MultipleChoice, MultipleChoice, QSortThenBy> {
  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByCorrectAnswerIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswerIndex', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByCorrectAnswerIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswerIndex', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByIsOfficial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOfficial', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByIsOfficialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOfficial', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByIsResponded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResponded', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByIsRespondedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isResponded', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByQuestionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionType', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByQuestionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionType', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy> thenByStatement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statement', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByStatementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statement', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy> thenByXpInitial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpInitial', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByXpInitialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpInitial', Sort.desc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy> thenByXpReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpReview', Sort.asc);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QAfterSortBy>
      thenByXpReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpReview', Sort.desc);
    });
  }
}

extension MultipleChoiceQueryWhereDistinct
    on QueryBuilder<MultipleChoice, MultipleChoice, QDistinct> {
  QueryBuilder<MultipleChoice, MultipleChoice, QDistinct>
      distinctByAlternatives() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternatives');
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QDistinct>
      distinctByCorrectAnswerIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswerIndex');
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QDistinct>
      distinctByIsOfficial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOfficial');
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QDistinct>
      distinctByIsResponded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isResponded');
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QDistinct>
      distinctByQuestionType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QDistinct> distinctByStatement(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statement', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QDistinct>
      distinctByXpInitial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xpInitial');
    });
  }

  QueryBuilder<MultipleChoice, MultipleChoice, QDistinct> distinctByXpReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xpReview');
    });
  }
}

extension MultipleChoiceQueryProperty
    on QueryBuilder<MultipleChoice, MultipleChoice, QQueryProperty> {
  QueryBuilder<MultipleChoice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MultipleChoice, List<String>, QQueryOperations>
      alternativesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternatives');
    });
  }

  QueryBuilder<MultipleChoice, int, QQueryOperations>
      correctAnswerIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswerIndex');
    });
  }

  QueryBuilder<MultipleChoice, bool, QQueryOperations> isOfficialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOfficial');
    });
  }

  QueryBuilder<MultipleChoice, bool, QQueryOperations> isRespondedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isResponded');
    });
  }

  QueryBuilder<MultipleChoice, QuestionType, QQueryOperations>
      questionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionType');
    });
  }

  QueryBuilder<MultipleChoice, String, QQueryOperations> statementProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statement');
    });
  }

  QueryBuilder<MultipleChoice, int, QQueryOperations> xpInitialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xpInitial');
    });
  }

  QueryBuilder<MultipleChoice, int, QQueryOperations> xpReviewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xpReview');
    });
  }
}
