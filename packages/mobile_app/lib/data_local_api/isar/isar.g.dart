// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetBudgetIsarCollectionCollection on Isar {
  IsarCollection<String, BudgetIsarCollection> get budgetIsarCollections =>
      this.collection();
}

const BudgetIsarCollectionSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'BudgetIsarCollection',
    idName: 'isarId',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'isarId',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, BudgetIsarCollection>(
    serialize: serializeBudgetIsarCollection,
    deserialize: deserializeBudgetIsarCollection,
    deserializeProperty: deserializeBudgetIsarCollectionProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeBudgetIsarCollection(
    IsarWriter writer, BudgetIsarCollection object) {
  IsarCore.writeString(writer, 1, object.id);
  IsarCore.writeString(writer, 2, object.isarId);
  return Isar.fastHash(object.isarId);
}

@isarProtected
BudgetIsarCollection deserializeBudgetIsarCollection(IsarReader reader) {
  final object = BudgetIsarCollection();
  object.id = IsarCore.readString(reader, 1) ?? '';
  return object;
}

@isarProtected
dynamic deserializeBudgetIsarCollectionProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _BudgetIsarCollectionUpdate {
  bool call({
    required String isarId,
    String? id,
  });
}

class _BudgetIsarCollectionUpdateImpl implements _BudgetIsarCollectionUpdate {
  const _BudgetIsarCollectionUpdateImpl(this.collection);

  final IsarCollection<String, BudgetIsarCollection> collection;

  @override
  bool call({
    required String isarId,
    Object? id = ignore,
  }) {
    return collection.updateProperties([
          isarId
        ], {
          if (id != ignore) 1: id as String?,
        }) >
        0;
  }
}

sealed class _BudgetIsarCollectionUpdateAll {
  int call({
    required List<String> isarId,
    String? id,
  });
}

class _BudgetIsarCollectionUpdateAllImpl
    implements _BudgetIsarCollectionUpdateAll {
  const _BudgetIsarCollectionUpdateAllImpl(this.collection);

  final IsarCollection<String, BudgetIsarCollection> collection;

  @override
  int call({
    required List<String> isarId,
    Object? id = ignore,
  }) {
    return collection.updateProperties(isarId, {
      if (id != ignore) 1: id as String?,
    });
  }
}

extension BudgetIsarCollectionUpdate
    on IsarCollection<String, BudgetIsarCollection> {
  _BudgetIsarCollectionUpdate get update =>
      _BudgetIsarCollectionUpdateImpl(this);

  _BudgetIsarCollectionUpdateAll get updateAll =>
      _BudgetIsarCollectionUpdateAllImpl(this);
}

sealed class _BudgetIsarCollectionQueryUpdate {
  int call({
    String? id,
  });
}

class _BudgetIsarCollectionQueryUpdateImpl
    implements _BudgetIsarCollectionQueryUpdate {
  const _BudgetIsarCollectionQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<BudgetIsarCollection> query;
  final int? limit;

  @override
  int call({
    Object? id = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (id != ignore) 1: id as String?,
    });
  }
}

extension BudgetIsarCollectionQueryUpdate on IsarQuery<BudgetIsarCollection> {
  _BudgetIsarCollectionQueryUpdate get updateFirst =>
      _BudgetIsarCollectionQueryUpdateImpl(this, limit: 1);

  _BudgetIsarCollectionQueryUpdate get updateAll =>
      _BudgetIsarCollectionQueryUpdateImpl(this);
}

class _BudgetIsarCollectionQueryBuilderUpdateImpl
    implements _BudgetIsarCollectionQueryUpdate {
  const _BudgetIsarCollectionQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QOperations>
      query;
  final int? limit;

  @override
  int call({
    Object? id = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (id != ignore) 1: id as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension BudgetIsarCollectionQueryBuilderUpdate
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QOperations> {
  _BudgetIsarCollectionQueryUpdate get updateFirst =>
      _BudgetIsarCollectionQueryBuilderUpdateImpl(this, limit: 1);

  _BudgetIsarCollectionQueryUpdate get updateAll =>
      _BudgetIsarCollectionQueryBuilderUpdateImpl(this);
}

extension BudgetIsarCollectionQueryFilter on QueryBuilder<BudgetIsarCollection,
    BudgetIsarCollection, QFilterCondition> {
  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
          QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
          QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
          QAfterFilterCondition>
      isarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
          QAfterFilterCondition>
      isarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }
}

extension BudgetIsarCollectionQueryObject on QueryBuilder<BudgetIsarCollection,
    BudgetIsarCollection, QFilterCondition> {}

extension BudgetIsarCollectionQuerySortBy
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QSortBy> {
  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      sortById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      sortByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      sortByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      sortByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension BudgetIsarCollectionQuerySortThenBy
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QSortThenBy> {
  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      thenById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      thenByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      thenByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      thenByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension BudgetIsarCollectionQueryWhereDistinct
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QDistinct> {
  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }
}

extension BudgetIsarCollectionQueryProperty1
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QProperty> {
  QueryBuilder<BudgetIsarCollection, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BudgetIsarCollection, String, QAfterProperty> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension BudgetIsarCollectionQueryProperty2<R>
    on QueryBuilder<BudgetIsarCollection, R, QAfterProperty> {
  QueryBuilder<BudgetIsarCollection, (R, String), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BudgetIsarCollection, (R, String), QAfterProperty>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension BudgetIsarCollectionQueryProperty3<R1, R2>
    on QueryBuilder<BudgetIsarCollection, (R1, R2), QAfterProperty> {
  QueryBuilder<BudgetIsarCollection, (R1, R2, String), QOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BudgetIsarCollection, (R1, R2, String), QOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetExpenseIsarCollectionCollection on Isar {
  IsarCollection<String, ExpenseIsarCollection> get expenseIsarCollections =>
      this.collection();
}

const ExpenseIsarCollectionSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'ExpenseIsarCollection',
    idName: 'isarId',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'isarId',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, ExpenseIsarCollection>(
    serialize: serializeExpenseIsarCollection,
    deserialize: deserializeExpenseIsarCollection,
    deserializeProperty: deserializeExpenseIsarCollectionProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeExpenseIsarCollection(
    IsarWriter writer, ExpenseIsarCollection object) {
  IsarCore.writeString(writer, 1, object.id);
  IsarCore.writeString(writer, 2, object.isarId);
  return Isar.fastHash(object.isarId);
}

@isarProtected
ExpenseIsarCollection deserializeExpenseIsarCollection(IsarReader reader) {
  final object = ExpenseIsarCollection();
  object.id = IsarCore.readString(reader, 1) ?? '';
  return object;
}

@isarProtected
dynamic deserializeExpenseIsarCollectionProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _ExpenseIsarCollectionUpdate {
  bool call({
    required String isarId,
    String? id,
  });
}

class _ExpenseIsarCollectionUpdateImpl implements _ExpenseIsarCollectionUpdate {
  const _ExpenseIsarCollectionUpdateImpl(this.collection);

  final IsarCollection<String, ExpenseIsarCollection> collection;

  @override
  bool call({
    required String isarId,
    Object? id = ignore,
  }) {
    return collection.updateProperties([
          isarId
        ], {
          if (id != ignore) 1: id as String?,
        }) >
        0;
  }
}

sealed class _ExpenseIsarCollectionUpdateAll {
  int call({
    required List<String> isarId,
    String? id,
  });
}

class _ExpenseIsarCollectionUpdateAllImpl
    implements _ExpenseIsarCollectionUpdateAll {
  const _ExpenseIsarCollectionUpdateAllImpl(this.collection);

  final IsarCollection<String, ExpenseIsarCollection> collection;

  @override
  int call({
    required List<String> isarId,
    Object? id = ignore,
  }) {
    return collection.updateProperties(isarId, {
      if (id != ignore) 1: id as String?,
    });
  }
}

extension ExpenseIsarCollectionUpdate
    on IsarCollection<String, ExpenseIsarCollection> {
  _ExpenseIsarCollectionUpdate get update =>
      _ExpenseIsarCollectionUpdateImpl(this);

  _ExpenseIsarCollectionUpdateAll get updateAll =>
      _ExpenseIsarCollectionUpdateAllImpl(this);
}

sealed class _ExpenseIsarCollectionQueryUpdate {
  int call({
    String? id,
  });
}

class _ExpenseIsarCollectionQueryUpdateImpl
    implements _ExpenseIsarCollectionQueryUpdate {
  const _ExpenseIsarCollectionQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<ExpenseIsarCollection> query;
  final int? limit;

  @override
  int call({
    Object? id = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (id != ignore) 1: id as String?,
    });
  }
}

extension ExpenseIsarCollectionQueryUpdate on IsarQuery<ExpenseIsarCollection> {
  _ExpenseIsarCollectionQueryUpdate get updateFirst =>
      _ExpenseIsarCollectionQueryUpdateImpl(this, limit: 1);

  _ExpenseIsarCollectionQueryUpdate get updateAll =>
      _ExpenseIsarCollectionQueryUpdateImpl(this);
}

class _ExpenseIsarCollectionQueryBuilderUpdateImpl
    implements _ExpenseIsarCollectionQueryUpdate {
  const _ExpenseIsarCollectionQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QOperations>
      query;
  final int? limit;

  @override
  int call({
    Object? id = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (id != ignore) 1: id as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension ExpenseIsarCollectionQueryBuilderUpdate
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QOperations> {
  _ExpenseIsarCollectionQueryUpdate get updateFirst =>
      _ExpenseIsarCollectionQueryBuilderUpdateImpl(this, limit: 1);

  _ExpenseIsarCollectionQueryUpdate get updateAll =>
      _ExpenseIsarCollectionQueryBuilderUpdateImpl(this);
}

extension ExpenseIsarCollectionQueryFilter on QueryBuilder<
    ExpenseIsarCollection, ExpenseIsarCollection, QFilterCondition> {
  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
          QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
          QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
          QAfterFilterCondition>
      isarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
          QAfterFilterCondition>
      isarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }
}

extension ExpenseIsarCollectionQueryObject on QueryBuilder<
    ExpenseIsarCollection, ExpenseIsarCollection, QFilterCondition> {}

extension ExpenseIsarCollectionQuerySortBy
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QSortBy> {
  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      sortById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      sortByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      sortByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      sortByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension ExpenseIsarCollectionQuerySortThenBy
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QSortThenBy> {
  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      thenById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      thenByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      thenByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      thenByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension ExpenseIsarCollectionQueryWhereDistinct
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QDistinct> {
  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }
}

extension ExpenseIsarCollectionQueryProperty1
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QProperty> {
  QueryBuilder<ExpenseIsarCollection, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ExpenseIsarCollection, String, QAfterProperty> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension ExpenseIsarCollectionQueryProperty2<R>
    on QueryBuilder<ExpenseIsarCollection, R, QAfterProperty> {
  QueryBuilder<ExpenseIsarCollection, (R, String), QAfterProperty>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ExpenseIsarCollection, (R, String), QAfterProperty>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension ExpenseIsarCollectionQueryProperty3<R1, R2>
    on QueryBuilder<ExpenseIsarCollection, (R1, R2), QAfterProperty> {
  QueryBuilder<ExpenseIsarCollection, (R1, R2, String), QOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ExpenseIsarCollection, (R1, R2, String), QOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}
