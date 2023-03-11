// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isLoggedHash() => r'b7393127d4670c3fb7a7897b937c32702d98d307';

/// See also [isLogged].
@ProviderFor(isLogged)
final isLoggedProvider = Provider<bool>.internal(
  isLogged,
  name: r'isLoggedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isLoggedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsLoggedRef = ProviderRef<bool>;
String _$authNotifierHash() => r'7d3bcfabcd57f139447b8842f99a8749bef3aa7d';

/// See also [AuthNotifier].
@ProviderFor(AuthNotifier)
final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, AppToken?>.internal(
  AuthNotifier.new,
  name: r'authNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthNotifier = AsyncNotifier<AppToken?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
