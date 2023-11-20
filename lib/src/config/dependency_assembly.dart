import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_mobx/src/core/domain/use_case.dart';
import 'package:tutorial_mobx/src/modules/features/info/data/datasources/info_local_data_source.dart';
import 'package:tutorial_mobx/src/modules/features/info/data/repositories/info_repository_impl.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/repositories/info_repository.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/usecases/info_create_update_use_case.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/usecases/info_delete_use_case.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/usecases/info_find_all_use_case.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/usecases/info_find_use_case.dart';
import 'package:tutorial_mobx/src/modules/features/info/presentation/stores/info_store.dart';

///Instancia uma nova instancia do gerenciador de dependências
final dependencyAssembly = GetIt.instance;

///Configuração inicial das dependências do projeto
Future<void> setupDependencyAssemblies() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  //PackageInfo utilizado para pegar Informações do App ex:versão

  dependencyAssembly
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  _setUpInfoModuleAssembly();
}

void _setUpInfoModuleAssembly() {
  dependencyAssembly

    // Data Sources
    ..registerLazySingleton<InfoLocalDataSource>(
        () => InfoLocalDataSourceImpl(dependencyAssembly()))

    // Repository
    ..registerLazySingleton<InfoRepository>(
      () => InfoRepositoryImpl(infoLocalDataSource: dependencyAssembly()),
    )

    // Use Cases
    ..registerLazySingleton<UseCase<List<Information>, NoParams>>(
        () => InfoFindAllUseCase(repository: dependencyAssembly()),
        instanceName: 'getAllInformations')
    ..registerLazySingleton<UseCase<Information, String>>(
      () => InfoFindUseCase(repository: dependencyAssembly()),
      instanceName: 'getInformation'
    )
    ..registerLazySingleton<UseCase<Unit, Information>>(
      () => InfoCreateOrUpdateUseCase(repository: dependencyAssembly()),
      instanceName: 'createInformation',
    )
    ..registerLazySingleton<UseCase<Unit, String>>(
      () => InfoDeleteUseCase(repository: dependencyAssembly()),
      instanceName: 'removeInformation',
    )

    // Store
    ..registerFactory<InfoStore>(
      () => InfoStore(
        create: dependencyAssembly(instanceName: 'createInformation'),
        getAll: dependencyAssembly(instanceName: 'getAllInformations'),
        delete: dependencyAssembly(instanceName: 'removeInformation'),
        edit: dependencyAssembly(instanceName: 'createInformation'),
      ),
    );
}
