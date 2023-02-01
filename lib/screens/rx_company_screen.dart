import 'package:flutter/material.dart';
import 'package:rxdart_getx/data/models/company_model.dart';
import 'package:rxdart_getx/rx_controller/companies_controller.dart';

class RxCompaniesScreen extends StatelessWidget {
  RxCompaniesScreen({super.key});
  final CompaniesController _companiesController = CompaniesController()..fetchCompanies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rx"),
      ),
      body: StreamBuilder(
        stream: _companiesController.getCompanies,
        builder:
            (BuildContext context, AsyncSnapshot<List<CompanyModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
             children: List.generate(
                  snapshot.data!.length,
                  (index) => ListTile(
                        title: Text(snapshot.data![index].carModel),
                      )),
            ); 
          }
          if (snapshot.hasError) {
            Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
