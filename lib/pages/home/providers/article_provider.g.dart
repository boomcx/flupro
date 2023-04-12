// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articleListNotifierHash() =>
    r'2611bec59ca1f9b4d100221aa809bb1b18405295';

/// See also [ArticleListNotifier].
@ProviderFor(ArticleListNotifier)
final articleListNotifierProvider = AutoDisposeNotifierProvider<
    ArticleListNotifier, PagingController<int, ArticleModel>>.internal(
  ArticleListNotifier.new,
  name: r'articleListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$articleListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ArticleListNotifier
    = AutoDisposeNotifier<PagingController<int, ArticleModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
