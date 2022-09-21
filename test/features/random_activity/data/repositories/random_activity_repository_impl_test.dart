import 'package:dartz/dartz.dart';
import 'package:flutter_activity/core/connection/network_info.dart';
import 'package:flutter_activity/core/errors/exceptions.dart';
import 'package:flutter_activity/core/errors/failures.dart';
import 'package:flutter_activity/features/random_activity/data/datasources/random_activity_local_data_source.dart';
import 'package:flutter_activity/features/random_activity/data/datasources/random_activity_remote_data_source.dart';
import 'package:flutter_activity/features/random_activity/data/models/random_activity_model.dart';
import 'package:flutter_activity/features/random_activity/data/repositories/random_activity_repository_impl.dart';
import 'package:flutter_activity/features/random_activity/domain/entities/random_activity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'random_activity_repository_impl_test.mocks.dart';

@GenerateMocks([
  RandomActivityRemoteDataSource,
  RandomActivityLocalDataSource,
  NetworkInfo
])
void main() {
  late RandomActivityRepositoryImpl repository;
  late MockRandomActivityRemoteDataSource mockRemoteDataSource;
  late MockRandomActivityLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRandomActivityRemoteDataSource();
    mockLocalDataSource = MockRandomActivityLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = RandomActivityRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  const testRandomActivityModel = RandomActivityModel(
    activity: 'Go to the gym',
    type: 'recreational',
    participants: 1,
    price: 1,
    link: '',
    key: '123456789',
    accessibility: 1,
  );

  const RandomActivity testRandomActivity = testRandomActivityModel;

  group('When Internet is active', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test(
        'When Internet is active, return a success random activity from remote datasource',
        () async {
      // setup
      when(mockRemoteDataSource.getRandomActivity())
          .thenAnswer((_) async => testRandomActivityModel);
      // do
      final result = await repository.getRandomActivity();
      // test
      expect(result, equals(const Right(testRandomActivity)));
    });
    test(
        'When Internet is active, return a server exception from remote datasource',
        () async {
      // setup
      when(mockRemoteDataSource.getRandomActivity())
          .thenThrow(ServerException());
      // do
      Either<Failure, RandomActivity?> result =
          await repository.getRandomActivity();
      // test
      expect(
          result,
          equals(const Left(
              ServerFailure(errorMessage: 'This is a server exception'))));
    });
  });

  group('When internet is Not active', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
     test(
        'When Internet is not active, return a random activity from local datasource',
        () async {
      // setup
      when(mockLocalDataSource.getLastRandomActivity())
          .thenAnswer((_) async => testRandomActivityModel);
      // do
      final result = await repository.getRandomActivity();
      // test
      expect(result, equals(const Right(testRandomActivity)));
    });
    test(
        'When Internet is not active, throw cache exception from local datasource',
        () async {
      // setup
      when(mockLocalDataSource.getLastRandomActivity())
          .thenThrow(CacheException());
      // do
      Either<Failure, RandomActivity?> result =
          await repository.getRandomActivity();
      // test
      expect(
          result,
          equals(const Left(
              CacheFailure(errorMessage: 'This is a cache exception'))));
    });
  });
}
