// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$httpServiceHash() => r'86ae48b6257f33dacc24f99961c62280898afa48';

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

/// See also [httpService].
@ProviderFor(httpService)
const httpServiceProvider = HttpServiceFamily();

/// See also [httpService].
class HttpServiceFamily extends Family<HttpService> {
  /// See also [httpService].
  const HttpServiceFamily();

  /// See also [httpService].
  HttpServiceProvider call(
    String url,
  ) {
    return HttpServiceProvider(
      url,
    );
  }

  @override
  HttpServiceProvider getProviderOverride(
    covariant HttpServiceProvider provider,
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
  String? get name => r'httpServiceProvider';
}

/// See also [httpService].
class HttpServiceProvider extends AutoDisposeProvider<HttpService> {
  /// See also [httpService].
  HttpServiceProvider(
    String url,
  ) : this._internal(
          (ref) => httpService(
            ref as HttpServiceRef,
            url,
          ),
          from: httpServiceProvider,
          name: r'httpServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$httpServiceHash,
          dependencies: HttpServiceFamily._dependencies,
          allTransitiveDependencies:
              HttpServiceFamily._allTransitiveDependencies,
          url: url,
        );

  HttpServiceProvider._internal(
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
    HttpService Function(HttpServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HttpServiceProvider._internal(
        (ref) => create(ref as HttpServiceRef),
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
    return _HttpServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HttpServiceProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HttpServiceRef on AutoDisposeProviderRef<HttpService> {
  /// The parameter `url` of this provider.
  String get url;
}

class _HttpServiceProviderElement
    extends AutoDisposeProviderElement<HttpService> with HttpServiceRef {
  _HttpServiceProviderElement(super.provider);

  @override
  String get url => (origin as HttpServiceProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
