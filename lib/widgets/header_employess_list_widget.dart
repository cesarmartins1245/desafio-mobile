import 'package:desafio_mobile/controllers/home_controller.dart';
import 'package:desafio_mobile/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderEmployeesListWidget extends StatelessWidget {
  final HomeController controller;

  const HeaderEmployeesListWidget({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
        gradient: LinearGradient(
          colors: [
            ColorsUtils().gradientStartColor,
            ColorsUtils().gradientEndColor
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'h_photo'.tr,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: ColorsUtils().white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: controller.sortEmployees,
                  child: Text(
                    'h_name'.tr,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: ColorsUtils().white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.circle,
                color: ColorsUtils().white,
                size: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
