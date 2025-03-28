// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnswerUserCollection on Isar {
  IsarCollection<AnswerUser> get answerUsers => this.collection();
}

const AnswerUserSchema = CollectionSchema(
  name: r'AnswerUser',
  id: 2364243242473743353,
  properties: {
    r'answerDate': PropertySchema(
      id: 0,
      name: r'answerDate',
      type: IsarType.dateTime,
    ),
    r'correct': PropertySchema(
      id: 1,
      name: r'correct',
      type: IsarType.bool,
    ),
    r'providedAnswer': PropertySchema(
      id: 2,
      name: r'providedAnswer',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 3,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'xpEarned': PropertySchema(
      id: 4,
      name: r'xpEarned',
      type: IsarType.long,
    )
  },
  estimateSize: _answerUserEstimateSize,
  serialize: _answerUserSerialize,
  deserialize: _answerUserDeserialize,
  deserializeProp: _answerUserDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _answerUserGetId,
  getLinks: _answerUserGetLinks,
  attach: _answerUserAttach,
  version: '3.1.0+1',
);

int _answerUserEstimateSize(
  AnswerUser object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.providedAnswer.length * 3;
  return bytesCount;
}

void _answerUserSerialize(
  AnswerUser object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.answerDate);
  writer.writeBool(offsets[1], object.correct);
  writer.writeString(offsets[2], object.providedAnswer);
  writer.writeLong(offsets[3], object.questionId);
  writer.writeLong(offsets[4], object.xpEarned);
}

AnswerUser _answerUserDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnswerUser(
    answerDate: reader.readDateTime(offsets[0]),
    correct: reader.readBool(offsets[1]),
    id: id,
    providedAnswer: reader.readString(offsets[2]),
    questionId: reader.readLong(offsets[3]),
    xpEarned: reader.readLong(offsets[4]),
  );
  return object;
}

P _answerUserDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _answerUserGetId(AnswerUser object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _answerUserGetLinks(AnswerUser object) {
  return [];
}

void _answerUserAttach(IsarCollection<dynamic> col, Id id, AnswerUser object) {
  object.id = id;
}

extension AnswerUserQueryWhereSort
    on QueryBuilder<AnswerUser, AnswerUser, QWhere> {
  QueryBuilder<AnswerUser, AnswerUser, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnswerUserQueryWhere
    on QueryBuilder<AnswerUser, AnswerUser, QWhereClause> {
  QueryBuilder<AnswerUser, AnswerUser, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AnswerUser, AnswerUser, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterWhereClause> idBetween(
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

extension AnswerUserQueryFilter
    on QueryBuilder<AnswerUser, AnswerUser, QFilterCondition> {
  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> answerDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      answerDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answerDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      answerDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answerDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> answerDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answerDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> correctEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'providedAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'providedAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'providedAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'providedAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'providedAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'providedAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'providedAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'providedAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'providedAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      providedAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'providedAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> questionIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      questionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      questionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> questionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> xpEarnedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xpEarned',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition>
      xpEarnedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xpEarned',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> xpEarnedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xpEarned',
        value: value,
      ));
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterFilterCondition> xpEarnedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xpEarned',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AnswerUserQueryObject
    on QueryBuilder<AnswerUser, AnswerUser, QFilterCondition> {}

extension AnswerUserQueryLinks
    on QueryBuilder<AnswerUser, AnswerUser, QFilterCondition> {}

extension AnswerUserQuerySortBy
    on QueryBuilder<AnswerUser, AnswerUser, QSortBy> {
  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> sortByAnswerDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerDate', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> sortByAnswerDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerDate', Sort.desc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> sortByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> sortByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> sortByProvidedAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAnswer', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy>
      sortByProvidedAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAnswer', Sort.desc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> sortByXpEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpEarned', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> sortByXpEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpEarned', Sort.desc);
    });
  }
}

extension AnswerUserQuerySortThenBy
    on QueryBuilder<AnswerUser, AnswerUser, QSortThenBy> {
  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByAnswerDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerDate', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByAnswerDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerDate', Sort.desc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByProvidedAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAnswer', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy>
      thenByProvidedAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'providedAnswer', Sort.desc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByXpEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpEarned', Sort.asc);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QAfterSortBy> thenByXpEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpEarned', Sort.desc);
    });
  }
}

extension AnswerUserQueryWhereDistinct
    on QueryBuilder<AnswerUser, AnswerUser, QDistinct> {
  QueryBuilder<AnswerUser, AnswerUser, QDistinct> distinctByAnswerDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answerDate');
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QDistinct> distinctByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correct');
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QDistinct> distinctByProvidedAnswer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'providedAnswer',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QDistinct> distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }

  QueryBuilder<AnswerUser, AnswerUser, QDistinct> distinctByXpEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xpEarned');
    });
  }
}

extension AnswerUserQueryProperty
    on QueryBuilder<AnswerUser, AnswerUser, QQueryProperty> {
  QueryBuilder<AnswerUser, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnswerUser, DateTime, QQueryOperations> answerDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answerDate');
    });
  }

  QueryBuilder<AnswerUser, bool, QQueryOperations> correctProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correct');
    });
  }

  QueryBuilder<AnswerUser, String, QQueryOperations> providedAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'providedAnswer');
    });
  }

  QueryBuilder<AnswerUser, int, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<AnswerUser, int, QQueryOperations> xpEarnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xpEarned');
    });
  }
}
