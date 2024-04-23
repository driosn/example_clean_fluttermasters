import 'package:example_clean/features/random_dog_image/data/models/dog_image_model.dart';

abstract class RandomDogRemoteDataSource {
  Future<DogImageModel> generateRandomImage();
}
