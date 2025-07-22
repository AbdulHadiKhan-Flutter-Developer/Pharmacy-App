import 'package:flutter/material.dart';
import 'package:hoormedicalstore/screen/product_overview_screen.dart';
import 'package:hoormedicalstore/screen/terms_condition.dart';
import 'package:hoormedicalstore/widget/settings_widget.dart';

class Settings extends StatefulWidget {
  static const routeName = '/SettingsScreen';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isDarkmode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(ProductOverviewScreen.routeName),
          ),
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            SettingsWidget(Icons.dark_mode, () {
              setState(() {
                _isDarkmode != _isDarkmode;
                _isDarkmode ? Icons.dark_mode : Icons.light_mode;
              });
            }, 'Dark Mode'),
            Divider(),
            SettingsWidget(Icons.verified, () {}, 'two-step-verification'),
            Divider(),
            SettingsWidget(
                Icons.confirmation_num_rounded,
                () => Navigator.of(context)
                    .pushReplacementNamed(TermsCondition.routeName),
                'terms & condition'),
          ],
        ));
  }
}
