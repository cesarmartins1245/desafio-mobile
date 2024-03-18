import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double? firstCardHight;
  final double? secondCardHight;
  final double? thirdCardHight;

  const LoadingWidget({
    this.firstCardHight,
    this.secondCardHight,
    this.thirdCardHight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardLoading(
          height: firstCardHight ?? 0,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          margin: EdgeInsets.only(bottom: 10),
        ),
        CardLoading(
          height: secondCardHight ?? 0,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          margin: EdgeInsets.only(bottom: 10),
        ),
        CardLoading(
          height: thirdCardHight ?? 0,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          margin: EdgeInsets.only(bottom: 10),
        ),
      ],
    );
  }
}
