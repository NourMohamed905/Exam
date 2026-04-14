import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/storage/local_storage.dart';
import 'package:exam_app/features/home/home_subject/data/datasource/local/home_subject_local_contract.dart';
import 'package:exam_app/features/home/home_subject/data/datasource/remote/home_subject_remote_contract.dart';
import 'package:exam_app/features/home/home_subject/domain/entity/subject_response.dart';
import 'package:exam_app/features/home/home_subject/domain/repository/home_subject_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeSubjectRepoContract)
class HomeSubjectRepoImpl implements HomeSubjectRepoContract {
  final HomeSubjectRemoteContract remoteDataSource;
  final HomeSubjectLocalContract localDataSource;
  final LocalStorageService localStorageService;
  HomeSubjectRepoImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.localStorageService,
  );

  @override
  Future<BaseResponse<SubjectResponse>> getAllSubjects() async {
    final token = await localStorageService.getToken();
    final List<ConnectivityResult> connectivityResult = await Connectivity()
        .checkConnectivity();
    final bool hasInternet =
        connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);

    if (hasInternet && token != null && token.isNotEmpty) {
      var remoteResponse = await remoteDataSource.getAllSubjects(token);
      if (remoteResponse is SuccessBaseResponse<SubjectResponse>) {
        await localDataSource.cacheSubjects(remoteResponse.data);
        return remoteResponse;
      } else {
        var localResponse = await localDataSource.getAllSubjects();
        return localResponse;
      }
    }

    var localResponse = await localDataSource.getAllSubjects();
    return localResponse;
  }
}
