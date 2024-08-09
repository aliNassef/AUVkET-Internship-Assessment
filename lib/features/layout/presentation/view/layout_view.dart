import 'package:flutter/material.dart';
import 'layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  static const String routeName = '/layoutView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LayoutViewBody(),
      ),
    );
  }
}
