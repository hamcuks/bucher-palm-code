// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookModelCollection on Isar {
  IsarCollection<BookModel> get Books => this.collection();
}

const BookModelSchema = CollectionSchema(
  name: r'BookModel',
  id: -8798672064070329451,
  properties: {
    r'authors': PropertySchema(
      id: 0,
      name: r'authors',
      type: IsarType.objectList,
      target: r'BookAuthorModel',
    ),
    r'copyright': PropertySchema(
      id: 1,
      name: r'copyright',
      type: IsarType.bool,
    ),
    r'downloadCount': PropertySchema(
      id: 2,
      name: r'downloadCount',
      type: IsarType.long,
    ),
    r'formats': PropertySchema(
      id: 3,
      name: r'formats',
      type: IsarType.object,
      target: r'BookFormatModel',
    ),
    r'languages': PropertySchema(
      id: 4,
      name: r'languages',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 5,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _bookModelEstimateSize,
  serialize: _bookModelSerialize,
  deserialize: _bookModelDeserialize,
  deserializeProp: _bookModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'BookAuthorModel': BookAuthorModelSchema,
    r'BookFormatModel': BookFormatModelSchema
  },
  getId: _bookModelGetId,
  getLinks: _bookModelGetLinks,
  attach: _bookModelAttach,
  version: '3.1.0+1',
);

int _bookModelEstimateSize(
  BookModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.authors.length * 3;
  {
    final offsets = allOffsets[BookAuthorModel]!;
    for (var i = 0; i < object.authors.length; i++) {
      final value = object.authors[i];
      bytesCount +=
          BookAuthorModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 +
      BookFormatModelSchema.estimateSize(
          object.formats, allOffsets[BookFormatModel]!, allOffsets);
  bytesCount += 3 + object.languages.length * 3;
  {
    for (var i = 0; i < object.languages.length; i++) {
      final value = object.languages[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _bookModelSerialize(
  BookModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<BookAuthorModel>(
    offsets[0],
    allOffsets,
    BookAuthorModelSchema.serialize,
    object.authors,
  );
  writer.writeBool(offsets[1], object.copyright);
  writer.writeLong(offsets[2], object.downloadCount);
  writer.writeObject<BookFormatModel>(
    offsets[3],
    allOffsets,
    BookFormatModelSchema.serialize,
    object.formats,
  );
  writer.writeStringList(offsets[4], object.languages);
  writer.writeString(offsets[5], object.title);
}

BookModel _bookModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookModel(
    authors: reader.readObjectList<BookAuthorModel>(
          offsets[0],
          BookAuthorModelSchema.deserialize,
          allOffsets,
          BookAuthorModel(),
        ) ??
        [],
    copyright: reader.readBoolOrNull(offsets[1]),
    downloadCount: reader.readLong(offsets[2]),
    formats: reader.readObjectOrNull<BookFormatModel>(
          offsets[3],
          BookFormatModelSchema.deserialize,
          allOffsets,
        ) ??
        BookFormatModel(),
    id: id,
    languages: reader.readStringList(offsets[4]) ?? [],
    title: reader.readString(offsets[5]),
  );
  return object;
}

P _bookModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<BookAuthorModel>(
            offset,
            BookAuthorModelSchema.deserialize,
            allOffsets,
            BookAuthorModel(),
          ) ??
          []) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<BookFormatModel>(
            offset,
            BookFormatModelSchema.deserialize,
            allOffsets,
          ) ??
          BookFormatModel()) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookModelGetId(BookModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookModelGetLinks(BookModel object) {
  return [];
}

void _bookModelAttach(IsarCollection<dynamic> col, Id id, BookModel object) {}

extension BookModelQueryWhereSort
    on QueryBuilder<BookModel, BookModel, QWhere> {
  QueryBuilder<BookModel, BookModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BookModelQueryWhere
    on QueryBuilder<BookModel, BookModel, QWhereClause> {
  QueryBuilder<BookModel, BookModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> idBetween(
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

extension BookModelQueryFilter
    on QueryBuilder<BookModel, BookModel, QFilterCondition> {
  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      authorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> authorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      authorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      authorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      authorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      authorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> copyrightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'copyright',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      copyrightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'copyright',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> copyrightEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'copyright',
        value: value,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      downloadCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      downloadCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      downloadCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      downloadCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languages',
        value: '',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languages',
        value: '',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> languagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      languagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension BookModelQueryObject
    on QueryBuilder<BookModel, BookModel, QFilterCondition> {
  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> authorsElement(
      FilterQuery<BookAuthorModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'authors');
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> formats(
      FilterQuery<BookFormatModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'formats');
    });
  }
}

extension BookModelQueryLinks
    on QueryBuilder<BookModel, BookModel, QFilterCondition> {}

extension BookModelQuerySortBy on QueryBuilder<BookModel, BookModel, QSortBy> {
  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByCopyright() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copyright', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByCopyrightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copyright', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByDownloadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCount', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByDownloadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCount', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension BookModelQuerySortThenBy
    on QueryBuilder<BookModel, BookModel, QSortThenBy> {
  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByCopyright() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copyright', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByCopyrightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copyright', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByDownloadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCount', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByDownloadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCount', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension BookModelQueryWhereDistinct
    on QueryBuilder<BookModel, BookModel, QDistinct> {
  QueryBuilder<BookModel, BookModel, QDistinct> distinctByCopyright() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'copyright');
    });
  }

  QueryBuilder<BookModel, BookModel, QDistinct> distinctByDownloadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadCount');
    });
  }

  QueryBuilder<BookModel, BookModel, QDistinct> distinctByLanguages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languages');
    });
  }

  QueryBuilder<BookModel, BookModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension BookModelQueryProperty
    on QueryBuilder<BookModel, BookModel, QQueryProperty> {
  QueryBuilder<BookModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookModel, List<BookAuthorModel>, QQueryOperations>
      authorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authors');
    });
  }

  QueryBuilder<BookModel, bool?, QQueryOperations> copyrightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'copyright');
    });
  }

  QueryBuilder<BookModel, int, QQueryOperations> downloadCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadCount');
    });
  }

  QueryBuilder<BookModel, BookFormatModel, QQueryOperations> formatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formats');
    });
  }

  QueryBuilder<BookModel, List<String>, QQueryOperations> languagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languages');
    });
  }

  QueryBuilder<BookModel, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
