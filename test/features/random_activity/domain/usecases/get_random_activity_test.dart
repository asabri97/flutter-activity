import 'package:dartz/dartz.dart';
import 'package:flutter_activity/core/usecases/usecase.dart';
import 'package:flutter_activity/features/random_activity/domain/entities/random_activity.dart';
import 'package:flutter_activity/features/random_activity/domain/repositories/random_activity_repository.dart';
import 'package:flutter_activity/features/random_activity/domain/usecases/get_random_activity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_random_activity_test.mocks.dart';

@GenerateMocks([RandomActivityRepository])
void main() {
  late GetRandomActivity usecase;
  late MockRandomActivityRepository mockRandomActivityRepository;

  setUp(() {
    mockRandomActivityRepository = MockRandomActivityRepository();
    usecase = GetRandomActivity(mockRandomActivityRepository);
  });

  RandomActivity testRandomActivity = const RandomActivity(
    activity: 'Go to the gym',
    type: 'recreational',
    participants: 1,
    price: 1,
    link: '',
    key: '123456789',
    accessibility: 1,
  );

  test(
    'should get random activity from the repository',
    () async {
      // Setup
      when(mockRandomActivityRepository.getRandomActivity())
          .thenAnswer((_) async => Right(testRandomActivity));
      // Do
      final result = await usecase(NoParams());
      // Test
      expect(result, Right(testRandomActivity));
      verify(mockRandomActivityRepository.getRandomActivity());
      verifyNoMoreInteractions(mockRandomActivityRepository);
    },
  );
}