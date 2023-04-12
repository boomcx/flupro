// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spinnerGroupHash() => r'680c5b9f8ae7c37d145cae398e480bb13afa811e';

/// See also [spinnerGroup].
@ProviderFor(spinnerGroup)
final spinnerGroupProvider =
    AutoDisposeProvider<Tuple2<SpinnerFilterEntity, int>>.internal(
  spinnerGroup,
  name: r'spinnerGroupProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$spinnerGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpinnerGroupRef
    = AutoDisposeProviderRef<Tuple2<SpinnerFilterEntity, int>>;
String _$spinnerFilterNotifierHash() =>
    r'ba34767f2b6ad4f8ae5f2c99d6cd8fb4ae18095a';

/// See also [SpinnerFilterNotifier].
@ProviderFor(SpinnerFilterNotifier)
final spinnerFilterNotifierProvider = AutoDisposeNotifierProvider<
    SpinnerFilterNotifier, SpinnerFilterState>.internal(
  SpinnerFilterNotifier.new,
  name: r'spinnerFilterNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$spinnerFilterNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SpinnerFilterNotifier = AutoDisposeNotifier<SpinnerFilterState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
