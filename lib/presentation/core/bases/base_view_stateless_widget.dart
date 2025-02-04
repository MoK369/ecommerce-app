import 'package:flutter/material.dart';

abstract class BaseViewStatelessWidget extends StatelessWidget {
  const BaseViewStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return customBuild(context, theme);
  }

  Widget customBuild(BuildContext context, ThemeData theme);
}
