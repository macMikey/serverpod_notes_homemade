/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Note extends _i1.TableRow implements _i1.ProtocolSerialization {
  Note._({
    int? id,
    required this.text,
  }) : super(id);

  factory Note({
    int? id,
    required String text,
  }) = _NoteImpl;

  factory Note.fromJson(Map<String, dynamic> jsonSerialization) {
    return Note(
      id: jsonSerialization['id'] as int?,
      text: jsonSerialization['text'] as String,
    );
  }

  static final t = NoteTable();

  static const db = NoteRepository._();

  String text;

  @override
  _i1.Table get table => t;

  Note copyWith({
    int? id,
    String? text,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'text': text,
    };
  }

  static NoteInclude include() {
    return NoteInclude._();
  }

  static NoteIncludeList includeList({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    NoteInclude? include,
  }) {
    return NoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Note.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Note.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NoteImpl extends Note {
  _NoteImpl({
    int? id,
    required String text,
  }) : super._(
          id: id,
          text: text,
        );

  @override
  Note copyWith({
    Object? id = _Undefined,
    String? text,
  }) {
    return Note(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
    );
  }
}

class NoteTable extends _i1.Table {
  NoteTable({super.tableRelation}) : super(tableName: 'note') {
    text = _i1.ColumnString(
      'text',
      this,
    );
  }

  late final _i1.ColumnString text;

  @override
  List<_i1.Column> get columns => [
        id,
        text,
      ];
}

class NoteInclude extends _i1.IncludeObject {
  NoteInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Note.t;
}

class NoteIncludeList extends _i1.IncludeList {
  NoteIncludeList._({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Note.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Note.t;
}

class NoteRepository {
  const NoteRepository._();

  Future<List<Note>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Note?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Note?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<Note>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Note>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Note>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Note> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Note>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Note>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Note> rows, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Note>(
      rows,
      columns: columns?.call(Note.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Note> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Note row, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Note>(
      row,
      columns: columns?.call(Note.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Note>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Note>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Note> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Note>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Note>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<NoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Note>(
      where: where(Note.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Note>(
      where: where?.call(Note.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
