import 'package:example_clean/core/failure/failure.dart';
import 'package:example_clean/core/result/result.dart';
import 'package:example_clean/features/random_dog_image/data/datasources/random_dog_remote_datasource.dart';
import 'package:example_clean/features/random_dog_image/domain/entities/dog_image.dart';
import 'package:example_clean/features/random_dog_image/domain/repositories/random_dog_image_repository.dart';

class RandomDogImageRepositoryImpl implements RandomDogImageRepository {
  const RandomDogImageRepositoryImpl({
    required RandomDogRemoteDataSource randomDogRemoteDataSource,
  }) : _remoteDataSource = randomDogRemoteDataSource;

  final RandomDogRemoteDataSource _remoteDataSource;

  @override
  Future<Result<DogImage, Failure>> getRandomImage() async {
    try {
      final dogImage = await _remoteDataSource.generateRandomImage();

      return Success(dogImage);
    } catch (error) {
      return Error(
        const Failure(
          message: 'Error inesperado',
        ),
      );
    }
  }
}
