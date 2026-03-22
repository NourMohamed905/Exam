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
import '../../core/storage/local_storage.dart' as _i140;
import '../../features/auth/forget_password/data/data_source/forget_remote_datasource.dart'
    as _i780;
import '../../features/auth/forget_password/data/data_source/forget_remote_datasource_impl.dart'
    as _i570;
import '../../features/auth/forget_password/data/repository/forget_pass_repo_impl.dart'
    as _i813;
import '../../features/auth/forget_password/domain/repository/forget_pass_repo_contract.dart'
    as _i171;
import '../../features/auth/forget_password/domain/usecase/forget_pass_usecase.dart'
    as _i490;
import '../../features/auth/forget_password/domain/usecase/reset_pass_usecase.dart'
    as _i865;
import '../../features/auth/forget_password/domain/usecase/verify_code_usecase.dart'
    as _i590;
import '../../features/auth/forget_password/ui/cubit/forget_pass_view_model.dart'
    as _i448;
import '../../features/auth/login/data/data_source/login_remote_datasource.dart'
    as _i853;
import '../../features/auth/login/data/data_source/login_remote_datasource_impl.dart'
    as _i660;
import '../../features/auth/login/data/repo/login_repo_impl.dart' as _i1001;
import '../../features/auth/login/domain/repository/login_repo_contract.dart'
    as _i359;
import '../../features/auth/login/domain/usecase/login_use_case.dart' as _i79;
import '../../features/auth/login/ui/cubit/login_view_model.dart' as _i785;
import '../data_source_execution.dart' as _i539;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i539.DataSourceExecution>(() => _i539.DataSourceExecution());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i140.LocalStorageService>(
      () => _i140.LocalStorageService(),
    );
    gh.factory<_i506.AuthApi>(() => _i506.AuthApi(gh<_i361.Dio>()));
    gh.factory<_i853.LoginRemoteDataSourceContract>(
      () => _i660.LoginRemoteDatasourceImpl(
        gh<_i506.AuthApi>(),
        gh<_i539.DataSourceExecution>(),
      ),
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
    gh.factory<_i780.ForgetRemoteDataSourceContract>(
      () => _i570.ForgetRemoteDatasourceImpl(
        authApi: gh<_i506.AuthApi>(),
        executor: gh<_i539.DataSourceExecution>(),
      ),
    );
    gh.factory<_i785.LoginViewModel>(
      () => _i785.LoginViewModel(
        gh<_i79.LoginUseCase>(),
        gh<_i140.LocalStorageService>(),
      ),
    );
    gh.factory<_i171.ForgetPassRepoContract>(
      () => _i813.ForgetRepoImpl(
        remoteDataSource: gh<_i780.ForgetRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i490.ForgetPasswordUseCase>(
      () => _i490.ForgetPasswordUseCase(gh<_i171.ForgetPassRepoContract>()),
    );
    gh.factory<_i865.ResetPasswordUseCase>(
      () => _i865.ResetPasswordUseCase(gh<_i171.ForgetPassRepoContract>()),
    );
    gh.factory<_i590.VerifyCodeUseCase>(
      () => _i590.VerifyCodeUseCase(gh<_i171.ForgetPassRepoContract>()),
    );
    gh.factory<_i448.ForgetPasswordViewModel>(
      () => _i448.ForgetPasswordViewModel(
        gh<_i490.ForgetPasswordUseCase>(),
        gh<_i590.VerifyCodeUseCase>(),
        gh<_i865.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
