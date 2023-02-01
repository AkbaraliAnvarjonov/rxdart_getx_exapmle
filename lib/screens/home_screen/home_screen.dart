import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:rxdart_getx/screens/getx_company_screen.dart';
import 'package:rxdart_getx/screens/rx_company_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(GetxCompanyScreen());
                  },
                  child: const Text("Getx")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(RxCompaniesScreen());
                  },
                  child: const Text("Rx")),
            ],
          ),
        ),
      ),
    );
  }
}
