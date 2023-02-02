import 'package:get/get.dart';
import 'package:rxdart_getx/data/models/my_response.dart';
import 'package:rxdart_getx/data/repositories/company_repositories.dart';
import 'package:rxdart_getx/data/service/companies_api_service.dart';

class GetxCompaniesController extends GetxController {
  GetxCompaniesController() {
    fetchCompanies();
  }
  final RxBool isLoading = true.obs; 
  final Rx<MyResponse> companies = MyResponse(error: "").obs;

  fetchCompanies() async {
    CompanyRepos companyRepos = CompanyRepos(apiService: CompaniesApiService());
    MyResponse myResponse = await companyRepos.getAllCars();

    if (myResponse.error.isEmpty) {
      companies.value.data = myResponse.data;
    }
    if (myResponse.error.isNotEmpty) {
      companies.value.error = myResponse.error;
    }
    isLoading.value = false;
  }
}
