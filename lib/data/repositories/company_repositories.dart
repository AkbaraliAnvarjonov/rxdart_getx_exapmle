import 'package:rxdart_getx/data/models/my_response.dart';
import 'package:rxdart_getx/data/service/companies_api_service.dart';

class CompanyRepos {
  CompanyRepos({required this.apiService});

  final CompaniesApiService apiService;

  Future<MyResponse> getAllCars() => apiService.getCarsList();
}
