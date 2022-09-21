
import 'dart:convert';

import 'package:flutter_activity/features/random_activity/data/datasources/random_activity_local_data_source.dart';
import 'package:flutter_activity/features/random_activity/data/models/random_activity_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../testing_data/get_string.dart';
import 'random_activity_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {

late RandomActivityLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = RandomActivityLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences);
  });

  final testRandomActivityModel = RandomActivityModel.fromJson(
      json.decode(getString('random_activity.json')));

  test(
    'Return Random Activity from Cache SharedPreferences',
    () async {
      //setup
      when(mockSharedPreferences.getString(any))
          .thenReturn(getString('random_activity.json'));
      //do
      final result = await dataSource.getLastRandomActivity();
      //test
      verify(mockSharedPreferences.getString(cachedRandomActivity));
      expect(result, equals(testRandomActivityModel));
    },
  );
}