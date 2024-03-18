import 'package:desafio_mobile/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoadingWidget(
          firstCardHight: 30,
        ),
        LoadingWidget(
          firstCardHight: 50,
        ),
        LoadingWidget(
          firstCardHight: 50,
          secondCardHight: 100,
        ),
        LoadingWidget(
          firstCardHight: 50,
          secondCardHight: 100,
        ),
        LoadingWidget(
          firstCardHight: 50,
          secondCardHight: 100,
        ),
      ],
    );
  }
}
