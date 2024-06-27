// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_format_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BookFormatModelSchema = Schema(
  name: r'BookFormatModel',
  id: -7470142826669298668,
  properties: {
    r'epub': PropertySchema(
      id: 0,
      name: r'epub',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 1,
      name: r'image',
      type: IsarType.string,
    ),
    r'text': PropertySchema(
      id: 2,
      name: r'text',
      type: IsarType.string,
    ),
    r'webPages': PropertySchema(
      id: 3,
      name: r'webPages',
      type: IsarType.string,
    )
  },
  estimateSize: _bookFormatModelEstimateSize,
  serialize: _bookFormatModelSerialize,
  deserialize: _bookFormatModelDeserialize,
  deserializeProp: _bookFormatModelDeserializeProp,
);

int _bookFormatModelEstimateSize(
  BookFormatModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.epub;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webPages;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _bookFormatModelSerialize(
  BookFormatModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.epub);
  writer.writeString(offsets[1], object.image);
  writer.writeString(offsets[2], object.text);
  writer.writeString(offsets[3], object.webPages);
}

BookFormatModel _bookFormatModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookFormatModel(
    epub: reader.readStringOrNull(offsets[0]),
    image: reader.readStringOrNull(offsets[1]),
    text: reader.readStringOrNull(offsets[2]),
    webPages: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _bookFormatModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BookFormatModelQueryFilter
    on QueryBuilder<BookFormatModel, BookFormatModel, QFilterCondition> {
  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'epub',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'epub',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'epub',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'epub',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'epub',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'epub',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'epub',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'epub',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'epub',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'epub',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'epub',
        value: '',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      epubIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'epub',
        value: '',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webPages',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webPages',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webPages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webPages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webPages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webPages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webPages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webPages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webPages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webPages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webPages',
        value: '',
      ));
    });
  }

  QueryBuilder<BookFormatModel, BookFormatModel, QAfterFilterCondition>
      webPagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webPages',
        value: '',
      ));
    });
  }
}

extension BookFormatModelQueryObject
    on QueryBuilder<BookFormatModel, BookFormatModel, QFilterCondition> {}
