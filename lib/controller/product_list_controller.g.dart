// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productListControllerHash() =>
    r'a6ca13670e7a32e03d75e4fbe5628e796801474e';

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

abstract class _$ProductListController
    extends BuildlessAutoDisposeAsyncNotifier<ProductResponse> {
  late final CategoryModel category;

  FutureOr<ProductResponse> build(
    CategoryModel category,
  );
}

/// See also [ProductListController].
@ProviderFor(ProductListController)
const productListControllerProvider = ProductListControllerFamily();

/// See also [ProductListController].
class ProductListControllerFamily extends Family<AsyncValue<ProductResponse>> {
  /// See also [ProductListController].
  const ProductListControllerFamily();

  /// See also [ProductListController].
  ProductListControllerProvider call(
    CategoryModel category,
  ) {
    return ProductListControllerProvider(
      category,
    );
  }

  @override
  ProductListControllerProvider getProviderOverride(
    covariant ProductListControllerProvider provider,
  ) {
    return call(
      provider.category,
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
  String? get name => r'productListControllerProvider';
}

/// See also [ProductListController].
class ProductListControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductListController,
        ProductResponse> {
  /// See also [ProductListController].
  ProductListControllerProvider(
    CategoryModel category,
  ) : this._internal(
          () => ProductListController()..category = category,
          from: productListControllerProvider,
          name: r'productListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productListControllerHash,
          dependencies: ProductListControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductListControllerFamily._allTransitiveDependencies,
          category: category,
        );

  ProductListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final CategoryModel category;

  @override
  FutureOr<ProductResponse> runNotifierBuild(
    covariant ProductListController notifier,
  ) {
    return notifier.build(
      category,
    );
  }

  @override
  Override overrideWith(ProductListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductListControllerProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductListController,
      ProductResponse> createElement() {
    return _ProductListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductListControllerProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ProductResponse> {
  /// The parameter `category` of this provider.
  CategoryModel get category;
}

class _ProductListControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductListController,
        ProductResponse> with ProductListControllerRef {
  _ProductListControllerProviderElement(super.provider);

  @override
  CategoryModel get category =>
      (origin as ProductListControllerProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
