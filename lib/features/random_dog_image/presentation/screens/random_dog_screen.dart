import 'package:dio/dio.dart';
import 'package:example_clean/features/random_dog_image/data/datasources/random_api_datasource.dart';
import 'package:example_clean/features/random_dog_image/data/repositories/random_dog_image_repository_impl.dart';
import 'package:example_clean/features/random_dog_image/domain/usecases/get_random_dog_image_usecase.dart';
import 'package:example_clean/features/random_dog_image/presentation/notifiers/random_dog_image_notifier.dart';
import 'package:flutter/material.dart';

class RandomDogScreen extends StatefulWidget {
  const RandomDogScreen({super.key});

  @override
  State<RandomDogScreen> createState() => _RandomDogScreenState();
}

class _RandomDogScreenState extends State<RandomDogScreen> {
  final _randomDogImageNotifier = RandomDogImageNotifier(
    getRandomDogImageUseCase: GetRandomDogImageUseCase(
      randomDogImageRepository: RandomDogImageRepositoryImpl(
        randomDogRemoteDataSource: RandomAPIDataSource(
          dio: Dio(),
        ),
      ),
    ),
  );

  @override
  void initState() {
    _randomDogImageNotifier.generateRandomImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _randomDogImageNotifier.generateRandomImage();
        },
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListenableBuilder(
            listenable: _randomDogImageNotifier,
            builder: (context, child) {
              return switch (_randomDogImageNotifier.randomDogImageState) {
                InitialState() => const SizedBox(),
                LoadingState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                LoadedState(dogImage: final dogImage) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(dogImage.message),
                      ),
                    ),
                  ),
                FailureState() => const Center(
                    child: Text('Hubo un problema al cargar la imagen'),
                  )
              };
            },
          ),
        ),
      ),
    );
  }
}
