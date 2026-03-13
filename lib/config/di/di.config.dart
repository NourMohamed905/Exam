// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/auth/auth_api.dart' as _i506;
import '../../core/storage/auth_local_storage.dart' as _i449;
import '../../features/auth/login/data/data_source/login_remote_datasource.dart'
    as _i853;
import '../../features/auth/login/data/data_source/login_remote_datasource_impl.dart'
    as _i660;
import '../../features/auth/login/data/repo/login_repo_impl.dart' as _i1001;
import '../../features/auth/login/domain/repository/login_repo_contract.dart'
    as _i359;
import '../../features/auth/login/domain/usecase/login_use_case.dart' as _i79;
import '../../features/auth/login/ui/cubit/login_view_model.dart' as _i785;
import '../../features/auth/signup/data/data_source/signup_remote_datasource.dart'
    as _i188;
import '../../features/auth/signup/data/data_source/signup_remote_datasource_impl.dart'
    as _i893;
import '../../features/auth/signup/data/repo/signup_repo_impl.dart' as _i767;
import '../../features/auth/signup/domain/repository/signup_repository.dart'
    as _i192;
import '../../features/auth/signup/domain/usecase/signup_use_case.dart'
    as _i685;
import '../../features/auth/signup/ui/cubit/signup_view_model.dart' as _i60;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i449.AuthLocalStorage>(() => _i449.AuthLocalStorage());
    gh.factory<_i506.AuthApi>(() => _i506.AuthApi(gh<_i361.Dio>()));
    gh.factory<_i853.LoginRemoteDataSourceContract>(
      () => _i660.LoginRemoteDatasourceImpl(gh<_i506.AuthApi>()),
    );
    gh.factory<_i188.SignupRemoteDataSourceContract>(
      () => _i893.SignupRemoteDatasourceImpl(gh<_i506.AuthApi>()),
    );
    gh.factory<_i359.LoginRepoContract>(
      () => _i1001.LoginRepoImpl(
        remoteDataSource: gh<_i853.LoginRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i192.SignupRepoContract>(
      () => _i767.SignupRepoImpl(
        remoteDataSource: gh<_i188.SignupRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i79.LoginUseCase>(
      () => _i79.LoginUseCase(contract: gh<_i359.LoginRepoContract>()),
    );
    gh.factory<_i685.SignupUseCase>(
      () => _i685.SignupUseCase(contract: gh<_i192.SignupRepoContract>()),
    );
    gh.factory<_i785.LoginViewModel>(
      () => _i785.LoginViewModel(
        gh<_i79.LoginUseCase>(),
        gh<_i449.AuthLocalStorage>(),
      ),
    );
    gh.factory<_i60.SignupViewModel>(
      () => _i60.SignupViewModel(gh<_i685.SignupUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
