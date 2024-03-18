import 'package:desafio_mobile/data/models/employee_model.dart';
import 'package:desafio_mobile/data/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeController extends GetxController {
  RxList<EmployeeModel> employeesList = <EmployeeModel>[].obs;
  RxList<EmployeeModel> filteredEmployees = <EmployeeModel>[].obs;
  var loading = false.obs;
  var isAscendingOrder = true.obs;

  @override
  void onInit() async {
    await getEmployees();
    super.onInit();
  }

  Future<void> getEmployees() async {
    try {
      loading.value = true;

      employeesList.value = await HomeService().fetchEmployees() ?? [];
      filteredEmployees.value = List.from(employeesList);
      await Future.delayed(Duration(seconds: 2));

      loading.value = false;
    } catch (e) {
      Get.printError(info: e.toString());
    }
  }

  void filterEmployees(String query) {
    filteredEmployees.clear();

    if (query.isEmpty) {
      filteredEmployees.value = List.from(employeesList);
    } else {
      filteredEmployees.addAll(
        employeesList.where((employee) =>
            employee.name.toLowerCase().contains(query.toLowerCase()) ||
            employee.job.toLowerCase().contains(query.toLowerCase()) ||
            employee.phone.toLowerCase().contains(query.toLowerCase())),
      );
    }
    update();
  }

  void sortEmployees() {
    isAscendingOrder.value = !isAscendingOrder.value;

    if (isAscendingOrder.value) {
      filteredEmployees.sort((a, b) => a.name.compareTo(b.name));
    } else {
      filteredEmployees.sort((a, b) => b.name.compareTo(a.name));
    }
    update();
  }

  void onExpandedCard({required int contractIndex}) async {
    filteredEmployees[contractIndex].isExpanded.value =
        !filteredEmployees[contractIndex].isExpanded.value;
    filteredEmployees[contractIndex].isExpanded.refresh();
  }

  String formatPhoneNumber(String phoneNumber) {
    var maskFormatter = MaskTextInputFormatter(
      mask: '+## (##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return maskFormatter
        .formatEditUpdate(
          TextEditingValue.empty,
          TextEditingValue(text: phoneNumber),
        )
        .text;
  }
}
