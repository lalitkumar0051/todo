class FontSizeManager {
  static double currentFontSize = 16; // default medium

  static void setSmall() => currentFontSize = 10;
  static void setMedium() => currentFontSize = 16;
  static void setLarge() => currentFontSize = 50;
}
