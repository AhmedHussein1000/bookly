// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 1;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      id: fields[0] as String,
      title: fields[1] as String?,
      imageUrl: fields[2] as String?,
      firstAuthor: fields[3] as String?,
      description: fields[4] as String?,
      previewLink: fields[5] as String?,
      averageRating: fields[6] as num?,
      ratingCount: fields[7] as int?,
      category: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.firstAuthor)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.previewLink)
      ..writeByte(6)
      ..write(obj.averageRating)
      ..writeByte(7)
      ..write(obj.ratingCount)
      ..writeByte(8)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
