enum AppIcon {
  strongArm('strong_arm'),
  checkCompleted('check_completed'),
  diamond('diamond'),
  fire('fire'),
  silhouette('silhouette'),
  target('target'),
  ;

  final String iconCode;
  final String assetPath;

  const AppIcon(this.iconCode) : assetPath = 'assets/emojis/$iconCode.png';

  static AppIcon fromCode(String code) {
    return AppIcon.values.firstWhere(
      (icon) => icon.iconCode == code,
      orElse: () => throw ArgumentError('No icon found with code: $code'),
    );
  }

  static AppIcon fromPath(String path) {
    final iconCode = path.split('/').last.replaceAll('.svg', '');
    return fromCode(iconCode);
  }
}
