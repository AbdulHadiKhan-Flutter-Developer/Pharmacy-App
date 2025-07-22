import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onpressed;

  SettingsWidget(this.iconData, this.onpressed, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Card(
        color: Colors.deepPurple,
        child: GestureDetector(
          onTap: onpressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 5, bottom: 5),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 5, bottom: 5),
                child: Icon(
                  color: Colors.white,
                  iconData,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
