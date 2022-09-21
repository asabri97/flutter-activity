import 'dart:convert';

import 'package:flutter_activity/features/random_activity/data/datasources/random_activity_remote_data_source.dart';
import 'package:flutter_activity/features/random_activity/data/models/random_activity_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

import '../../testing_data/get_string.dart';
import 'random_activity_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late RandomActivityRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = RandomActivityRemoteDataSourceImpl(dio: mockDio);
  });

  final testRandomActivityModel = RandomActivityModel.fromJson(
      json.decode(getString('random_activity.json')));

  test(
    'Return a random activity when the response code is success 200',
    () async {
      //setup
      when(
        mockDio.get('https://www.boredapi.com/api/activity'),
      ).thenAnswer(
        (_) async => Response(
          data: json.decode(getString('random_activity.json')),
          requestOptions: RequestOptions(path: 'Random Path'),
          statusCode: 200,
        ),
      );
      //do
      final result = await dataSource.getRandomActivity();
      //test
      expect(result, equals(testRandomActivityModel));
    },
  );
}