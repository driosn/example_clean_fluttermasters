import 'package:dio/dio.dart';
import 'package:example_clean/features/random_dog_image/data/datasources/random_dog_remote_datasource.dart';
import 'package:example_clean/features/random_dog_image/data/models/dog_image_model.dart';

class RandomAPIDataSource implements RandomDogRemoteDataSource {
  const RandomAPIDataSource({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<DogImageModel> generateRandomImage() async {
    try {
      final response =
          await _dio.get('https://dog.ceo/api/breeds/image/random');

      if (response.statusCode == 200) {
        final json = response.data;
        return DogImageModel.fromJson(json);
      }

      throw Exception('Unexpected Exception');
    } catch (exception) {
      rethrow;
    }
  }
}
