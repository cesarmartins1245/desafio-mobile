import 'dart:convert';

import 'package:desafio_mobile/data/models/employee_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<List<EmployeeModel>?> fetchEmployees() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://raw.githubusercontent.com/BeMobile/desafio-mobile/main/database.json',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['employees'];
        final List<EmployeeModel> employees = jsonData.map((data) {
          return EmployeeModel.fromJson(data as Map<String, dynamic>);
        }).toList();
        return employees;
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      Get.printError(info: e.toString());
      rethrow;
    }
  }
}
