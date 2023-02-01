import 'package:rxdart/rxdart.dart';
import 'package:rxdart_getx/data/models/company_model.dart';
import 'package:rxdart_getx/data/models/my_response.dart';
import 'package:rxdart_getx/data/repositories/company_repositories.dart';
import 'package:rxdart_getx/data/service/companies_api_service.dart';

class CompaniesController {
  final _companiesController = BehaviorSubject<List<CompanyModel>>();

  Stream<List<CompanyModel>> get getCompanies => _companiesController.stream;

  void fetchCompanies() async {
    CompanyRepos companyRepos = CompanyRepos(apiService: CompaniesApiService());
    MyResponse myResponse = await companyRepos.getAllCars();
    if (myResponse.error.isEmpty) {
      _companiesController.sink.add(myResponse.data);
    }
    if (myResponse.error.isNotEmpty) {
      _companiesController.sink.addError(myResponse.error);
    }
  }
}
