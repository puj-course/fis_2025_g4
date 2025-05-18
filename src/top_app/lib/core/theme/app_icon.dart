enum AppIcon {
  strongArm('strong_arm'),
  checkCompleted('check_completed'),
  diamond('diamond'),
  fire('fire'),
  silhouette('silhouette'),
  target('target'),
  clock('clock'),
  sandClock('sand_clock'),
  bell('bell'),
  bed('bed'),
  camera('camera'),
  openBook('open_book'),
  laptop('laptop'),
  ;

  final String iconCode;
  final String assetPath;

  const AppIcon(this.iconCode) : assetPath = 'assets/emojis/$iconCode.png';

  static AppIcon fromCode(String code) {
    return AppIcon.values.firstWhere(
      (AppIcon icon) => icon.iconCode == code,
      orElse: () => throw ArgumentError('No icon found with code: $code'),
    );
  }

  static AppIcon fromPath(String path) {
    final String iconCode = path.split('/').last.replaceAll('.svg', '');
    return fromCode(iconCode);
  }
}
