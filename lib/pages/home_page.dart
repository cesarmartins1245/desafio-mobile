import 'package:desafio_mobile/controllers/home_controller.dart';
import 'package:desafio_mobile/pages/loading_page.dart';
import 'package:desafio_mobile/utils/colors_utils.dart';
import 'package:desafio_mobile/widgets/default_app_bar_widget.dart';
import 'package:desafio_mobile/widgets/employees_list_widget.dart';
import 'package:desafio_mobile/widgets/header_employess_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils().lightGray,
      appBar: DefaultAppBarWidget(),
      body: Obx(
        () => RefreshIndicator(
          backgroundColor: ColorsUtils().gradientStartColor,
          color: ColorsUtils().white,
          onRefresh: controller.getEmployees,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 20,
            ),
            child: Visibility(
              visible: !controller.loading.value,
              replacement: LoadingPage(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'h_employees'.tr,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: ColorsUtils().black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: ColorsUtils().mediumGray,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 15,
                      ),
                      child: TextField(
                        onChanged: controller.filterEmployees,
                        decoration: InputDecoration(
                          hintText: 'h_search'.tr,
                          hintStyle: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: ColorsUtils().gray,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: ColorsUtils().mediumGray,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  HeaderEmployeesListWidget(controller: controller),
                  EmployeesListWidget(controller: controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
