// Mocks generated by Mockito 5.3.1 from annotations
// in flutter_activity/test/features/random_activity/data/repositories/random_activity_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_activity/core/connection/network_info.dart' as _i6;
import 'package:flutter_activity/features/random_activity/data/datasources/random_activity_local_data_source.dart'
    as _i3;
import 'package:flutter_activity/features/random_activity/data/datasources/random_activity_remote_data_source.dart'
    as _i2;
import 'package:flutter_activity/features/random_activity/data/models/random_activity_model.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [RandomActivityRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRandomActivityRemoteDataSource extends _i1.Mock
    implements _i2.RandomActivityRemoteDataSource {
  MockRandomActivityRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [RandomActivityLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRandomActivityLocalDataSource extends _i1.Mock
    implements _i3.RandomActivityLocalDataSource {
  MockRandomActivityLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void>? cacheRandomActivity(
          _i5.RandomActivityModel? activityToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheRandomActivity,
          [activityToCache],
        ),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>?);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i6.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }
}