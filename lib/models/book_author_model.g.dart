// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_author_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BookAuthorModelSchema = Schema(
  name: r'BookAuthorModel',
  id: 8492233920162560191,
  properties: {
    r'birthYear': PropertySchema(
      id: 0,
      name: r'birthYear',
      type: IsarType.long,
    ),
    r'deathYear': PropertySchema(
      id: 1,
      name: r'deathYear',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _bookAuthorModelEstimateSize,
  serialize: _bookAuthorModelSerialize,
  deserialize: _bookAuthorModelDeserialize,
  deserializeProp: _bookAuthorModelDeserializeProp,
);

int _bookAuthorModelEstimateSize(
  BookAuthorModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _bookAuthorModelSerialize(
  BookAuthorModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.birthYear);
  writer.writeLong(offsets[1], object.deathYear);
  writer.writeString(offsets[2], object.name);
}

BookAuthorModel _bookAuthorModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookAuthorModel(
    birthYear: reader.readLongOrNull(offsets[0]),
    deathYear: reader.readLongOrNull(offsets[1]),
    name: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _bookAuthorModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BookAuthorModelQueryFilter
    on QueryBuilder<BookAuthorModel, BookAuthorModel, QFilterCondition> {
  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      birthYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'birthYear',
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      birthYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'birthYear',
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      birthYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthYear',
        value: value,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      birthYearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthYear',
        value: value,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      birthYearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthYear',
        value: value,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      birthYearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      deathYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deathYear',
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      deathYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deathYear',
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      deathYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deathYear',
        value: value,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      deathYearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deathYear',
        value: value,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      deathYearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deathYear',
        value: value,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      deathYearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deathYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BookAuthorModel, BookAuthorModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension BookAuthorModelQueryObject
    on QueryBuilder<BookAuthorModel, BookAuthorModel, QFilterCondition> {}
