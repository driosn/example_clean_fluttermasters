import 'package:example_clean/core/failure/failure.dart';
import 'package:example_clean/core/result/result.dart';
import 'package:example_clean/core/use_case/use_case.dart';
import 'package:example_clean/features/random_dog_image/domain/entities/dog_image.dart';
import 'package:example_clean/features/random_dog_image/domain/repositories/random_dog_image_repository.dart';

class GetRandomDogImageUseCase implements UseCase<DogImage> {
  const GetRandomDogImageUseCase({
    required RandomDogImageRepository randomDogImageRepository,
  }) : _randomDogImageRepository = randomDogImageRepository;

  final RandomDogImageRepository _randomDogImageRepository;

  @override
  Future<Result<DogImage, Failure>> call() async {
    return _randomDogImageRepository.getRandomImage();
  }
}
