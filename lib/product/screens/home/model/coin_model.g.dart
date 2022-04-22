// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinCostModelAdapter extends TypeAdapter<CoinCostModel> {
  @override
  final int typeId = 0;

  @override
  CoinCostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinCostModel(
      coinName: fields[0] as String?,
      coins: (fields[2] as List?)?.cast<Coin>(),
      coinCost: fields[1] as String?,
      id: fields[3] as String?,
      totalAmountPaid: fields[5] as String?,
      totalNumberOfCoins: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CoinCostModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.coinName)
      ..writeByte(1)
      ..write(obj.coinCost)
      ..writeByte(2)
      ..write(obj.coins)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.totalNumberOfCoins)
      ..writeByte(5)
      ..write(obj.totalAmountPaid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinCostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoinAdapter extends TypeAdapter<Coin> {
  @override
  final int typeId = 1;

  @override
  Coin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coin(
      coinPrice: fields[0] as String?,
      numberOfCoin: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Coin obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.coinPrice)
      ..writeByte(1)
      ..write(obj.numberOfCoin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
