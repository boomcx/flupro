// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCacheHash() => r'f9c1022ca7c97aebfa8ca40dd00d561097b80033';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetCacheRef = AutoDisposeFutureProviderRef<String?>;

/// See also [getCache].
@ProviderFor(getCache)
const getCacheProvider = GetCacheFamily();

/// See also [getCache].
class GetCacheFamily extends Family<AsyncValue<String?>> {
  /// See also [getCache].
  const GetCacheFamily();

  /// See also [getCache].
  GetCacheProvider call(
    String url,
  ) {
    return GetCacheProvider(
      url,
    );
  }

  @override
  GetCacheProvider getProviderOverride(
    covariant GetCacheProvider provider,
  ) {
    return call(
      provider.url,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCacheProvider';
}

/// See also [getCache].
class GetCacheProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [getCache].
  GetCacheProvider(
    this.url,
  ) : super.internal(
          (ref) => getCache(
            ref,
            url,
          ),
          from: getCacheProvider,
          name: r'getCacheProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCacheHash,
          dependencies: GetCacheFamily._dependencies,
          allTransitiveDependencies: GetCacheFamily._allTransitiveDependencies,
        );

  final String url;

  @override
  bool operator ==(Object other) {
    return other is GetCacheProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
