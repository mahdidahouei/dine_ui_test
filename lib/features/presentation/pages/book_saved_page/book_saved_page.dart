import '../../global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';

class BookSavedPage extends StatelessWidget {
  const BookSavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Center(
      child: Text(localizations.translate("book")),
    );
  }
}
