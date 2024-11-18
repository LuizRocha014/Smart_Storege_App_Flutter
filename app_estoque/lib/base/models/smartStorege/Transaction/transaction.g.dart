// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      type: $enumDecode(_$TipoTransacaoEnumMap, json['type']),
      supplierId: json['supplierId'] as String?,
      customerId: json['customerId'] as String?,
      numberProd: (json['numberProd'] as num).toInt(),
      productId: json['productId'] as String,
      saleId: json['saleId'] as String,
      targetCompanyId: json['targetCompanyId'] as String?,
      originCompanyId: json['originCompanyId'] as String?,
      userId: json['userId'] as String,
      paymentMethod: json['paymentMethod'] as String?,
      note: json['note'] as String?,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
      sync: fromJsonBoolean(json['sync']),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'sync': instance.sync,
      'type': _$TipoTransacaoEnumMap[instance.type]!,
      'supplierId': instance.supplierId,
      'customerId': instance.customerId,
      'productId': instance.productId,
      'saleId': instance.saleId,
      'numberProd': instance.numberProd,
      'targetCompanyId': instance.targetCompanyId,
      'originCompanyId': instance.originCompanyId,
      'userId': instance.userId,
      'paymentMethod': instance.paymentMethod,
      'note': instance.note,
    };

const _$TipoTransacaoEnumMap = {
  TipoTransacao.sale: 'sale',
  TipoTransacao.buy: 'buy',
};
