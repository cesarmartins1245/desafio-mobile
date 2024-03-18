import 'package:desafio_mobile/controllers/home_controller.dart';
import 'package:desafio_mobile/utils/colors_utils.dart';
import 'package:desafio_mobile/widgets/dashed_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EmployeesListWidget extends StatelessWidget {
  final HomeController controller;
  const EmployeesListWidget({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: ColorsUtils().gray,
            height: 1,
          );
        },
        itemCount: controller.filteredEmployees.length,
        itemBuilder: (context, i) {
          return Obx(
            () => ExpansionPanelList(
              elevation: 0,
              expansionCallback: (panelIndex, isExpanded) {
                controller.onExpandedCard(contractIndex: i);
              },
              children: [
                ExpansionPanel(
                  isExpanded: controller.filteredEmployees[i].isExpanded.value,
                  canTapOnHeader: true,
                  headerBuilder: ((context, isExpanded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.5,
                            horizontal: 7,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 4,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    controller.filteredEmployees[i].image,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    controller.filteredEmployees[i].name
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      color: ColorsUtils().black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  body: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 30,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'h_role'.tr,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: ColorsUtils().black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                controller.filteredEmployees[i].job,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: ColorsUtils().black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DashedDividerWidget(
                            color: ColorsUtils().gray,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'h_admission_date'.tr,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: ColorsUtils().black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy').format(
                                  controller.filteredEmployees[i].admissionDate,
                                ),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: ColorsUtils().black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DashedDividerWidget(
                            color: ColorsUtils().gray,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'h_telephone'.tr,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: ColorsUtils().black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                controller.formatPhoneNumber(
                                    controller.filteredEmployees[i].phone),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: ColorsUtils().black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DashedDividerWidget(
                            color: ColorsUtils().gray,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
