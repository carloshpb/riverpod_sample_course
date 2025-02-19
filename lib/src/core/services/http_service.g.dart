// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$httpServiceProviderHash() =>
    r'856649649fdcafc83dbdb6c425fc4d9434f07036';

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

/// See also [httpServiceProvider].
@ProviderFor(httpServiceProvider)
const httpServiceProviderProvider = HttpServiceProviderFamily();

/// See also [httpServiceProvider].
class HttpServiceProviderFamily extends Family<HttpService> {
  /// See also [httpServiceProvider].
  const HttpServiceProviderFamily();

  /// See also [httpServiceProvider].
  HttpServiceProviderProvider call(
    String url,
  ) {
    return HttpServiceProviderProvider(
      url,
    );
  }

  @override
  HttpServiceProviderProvider getProviderOverride(
    covariant HttpServiceProviderProvider provider,
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
  String? get name => r'httpServiceProviderProvider';
}

/// See also [httpServiceProvider].
class HttpServiceProviderProvider extends AutoDisposeProvider<HttpService> {
  /// See also [httpServiceProvider].
  HttpServiceProviderProvider(
    String url,
  ) : this._internal(
          (ref) => httpServiceProvider(
            ref as HttpServiceProviderRef,
            url,
          ),
          from: httpServiceProviderProvider,
          name: r'httpServiceProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$httpServiceProviderHash,
          dependencies: HttpServiceProviderFamily._dependencies,
          allTransitiveDependencies:
              HttpServiceProviderFamily._allTransitiveDependencies,
          url: url,
        );

  HttpServiceProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  Override overrideWith(
    HttpService Function(HttpServiceProviderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HttpServiceProviderProvider._internal(
        (ref) => create(ref as HttpServiceProviderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<HttpService> createElement() {
    return _HttpServiceProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HttpServiceProviderProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HttpServiceProviderRef on AutoDisposeProviderRef<HttpService> {
  /// The parameter `url` of this provider.
  String get url;
}

class _HttpServiceProviderProviderElement
    extends AutoDisposeProviderElement<HttpService>
    with HttpServiceProviderRef {
  _HttpServiceProviderProviderElement(super.provider);

  @override
  String get url => (origin as HttpServiceProviderProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
