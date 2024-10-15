// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      type: $enumDecode(_$TipoTransacaoEnumMap, json['type']),
      supplierId: json['supplierId'] as String?,
      customerId: json['customerId'] as String?,
      productId: json['productId'] as String,
      targetCompany: json['targetCompany'] as String?,
      originCompany: json['originCompany'] as String?,
      userId: json['userId'] as String,
      paymentMethod: json['paymentMethod'] as String?,
      notes: json['notes'] as String?,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'type': _$TipoTransacaoEnumMap[instance.type]!,
      'supplierId': instance.supplierId,
      'customerId': instance.customerId,
      'productId': instance.productId,
      'targetCompany': instance.targetCompany,
      'originCompany': instance.originCompany,
      'userId': instance.userId,
      'paymentMethod': instance.paymentMethod,
      'notes': instance.notes,
    };

const _$TipoTransacaoEnumMap = {
  TipoTransacao.sale: 'sale',
  TipoTransacao.buy: 'buy',
};
