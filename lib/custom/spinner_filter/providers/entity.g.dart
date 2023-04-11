// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoreFilterEntity _$$_MoreFilterEntityFromJson(Map<String, dynamic> json) =>
    _$_MoreFilterEntity(
      key: json['key'] as String,
      isRadio: json['isRadio'] as bool? ?? true,
      title: json['title'] as String? ?? '',
      extra: $enumDecodeNullable(_$MExtraTypeEnumMap, json['extra']),
      type: $enumDecodeNullable(_$MoreContentTypeEnumMap, json['type']) ??
          MoreContentType.groupBtn,
      extraHolder: (json['extraHolder'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      extraData: json['extraData'],
      desc: json['desc'] as String? ?? '',
      isVip: json['isVip'] as bool? ?? false,
      isVipIcon: json['isVipIcon'] as bool? ?? false,
      items: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => SpinnerFilterItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MoreFilterEntityToJson(_$_MoreFilterEntity instance) =>
    <String, dynamic>{
      'key': instance.key,
      'isRadio': instance.isRadio,
      'title': instance.title,
      'extra': _$MExtraTypeEnumMap[instance.extra],
      'type': _$MoreContentTypeEnumMap[instance.type]!,
      'extraHolder': instance.extraHolder,
      'extraData': instance.extraData,
      'desc': instance.desc,
      'isVip': instance.isVip,
      'isVipIcon': instance.isVipIcon,
      'items': instance.items,
    };

const _$MExtraTypeEnumMap = {
  MExtraType.timepicker: 'timepicker',
};

const _$MoreContentTypeEnumMap = {
  MoreContentType.groupBtn: 'groupBtn',
  MoreContentType.checkList: 'checkList',
};

_$_MoreFilterItem _$$_MoreFilterItemFromJson(Map<String, dynamic> json) =>
    _$_MoreFilterItem(
      name: json['name'] as String,
      value: json['value'],
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MoreFilterItemToJson(_$_MoreFilterItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'selected': instance.selected,
    };
