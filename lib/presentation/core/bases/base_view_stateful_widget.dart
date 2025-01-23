import 'package:flutter/material.dart';

abstract class BaseViewStatefulWidget<T extends StatefulWidget> extends State<T> {
  late ThemeData theme;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
  }
}
