import 'dart:ui';

import 'package:evently/core/colors/main_colors.dart';

class LightColors implements MainColors {
  @override
  Color get error => const Color(0xFFFFECEF);

  @override
  Color get error100 => const Color(0xFFFFDADF);

  @override
  Color get primary100 => const Color(0xFFEEF4FE);

  @override
  Color get primary200 => const Color(0xFFDEE9FD);

  @override
  Color get primary300 => const Color(0xFFBDD3FA);

  @override
  Color get primary400 => const Color(0xFF9BBDF8);

  @override
  Color get primary500 => const Color(0xFF7AA7F5);

  @override
  Color get primary600 => const Color(0xFF699CF4);

  @override
  Color get secondary => const Color(0xFFF2F5F7);

  @override
  Color get warning => const Color(0xFFFFFAEC);
}