import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart_getx/data/models/my_response.dart';
import 'package:rxdart_getx/getX_controller/companies_controlles_get.dart';

class GetxCompanyScreen extends StatelessWidget {
  GetxCompanyScreen({super.key});
  final GetxCompaniesController _companiesController =
      Get.put(GetxCompaniesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GetX Companies")),
      body: Obx(() {
        MyResponse companies = _companiesController.companies.value;
        if (_companiesController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (companies.error.isNotEmpty) {
            return Center(child: Text(companies.error));
          } else {
            return ListView(
              children: List.generate(
                  companies.data.length,
                  (index) => ListTile(
                        title: Text(companies.data[index].carModel),
                      )),
            );
          }
        }
      }),
    );
  }
}
