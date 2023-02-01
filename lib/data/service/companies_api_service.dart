import 'package:dio/dio.dart';
import 'package:rxdart_getx/data/models/company_model.dart';
import 'package:rxdart_getx/data/models/my_response.dart';
import 'package:rxdart_getx/data/service/api_client.dart';

class CompaniesApiService extends ApiClient {
  Future<MyResponse> getCarsList() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/companies");

      if (response.statusCode == 200) {
        myResponse.data = (response.data["data"] as List)
            .map((e) => CompanyModel.fromJson(e))
            .toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
