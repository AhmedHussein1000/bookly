// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_books_response_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedBooksResponseEntityAdapter
    extends TypeAdapter<CachedBooksResponseEntity> {
  @override
  final int typeId = 0;

  @override
  CachedBooksResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedBooksResponseEntity(
      books: (fields[0] as List).cast<BookModel>(),
      timestamp: fields[1] as DateTime,
      totalItems: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CachedBooksResponseEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.books)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.totalItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedBooksResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
