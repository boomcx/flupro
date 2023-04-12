// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DropViewState _$$_DropViewStateFromJson(Map<String, dynamic> json) =>
    _$_DropViewState(
      years: (json['years'] as List<dynamic>?)
              ?.map((e) =>
                  SpinnerFilterEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      name: json['name'] as String? ?? '下拉筛选框',
    );

Map<String, dynamic> _$$_DropViewStateToJson(_$_DropViewState instance) =>
    <String, dynamic>{
      'years': instance.years,
      'name': instance.name,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dropViewControllerHash() =>
    r'7146961fd2edffe944b9c72b1394cd7eee1f14af';

/// See also [DropViewController].
@ProviderFor(DropViewController)
final dropViewControllerProvider =
    AutoDisposeNotifierProvider<DropViewController, DropViewState>.internal(
  DropViewController.new,
  name: r'dropViewControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dropViewControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DropViewController = AutoDisposeNotifier<DropViewState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
