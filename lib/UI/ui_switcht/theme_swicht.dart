import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class ThemeSwithc extends StatelessWidget {
  ThemeSwithc({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider=Provider.of<ThemeProvider>(context);
    var SwitchIcon=Icon(themeProvider.isDarkMode?CupertinoIcons.moon_fill:CupertinoIcons.sun_max_fill);


    return IconButton(
      onPressed: (){

        themeProvider.toggleTheme();

      },
    icon: SwitchIcon);
  }
}
