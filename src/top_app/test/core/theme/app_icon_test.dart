import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/core/theme/app_icon.dart';

void main() {
  group('AppIcon', () {
    group('fromCode', () {
      test('should return correct AppIcon for valid code', () {
        // Arrange
        const String validCode = 'strong_arm';

        // Act
        final AppIcon result = AppIcon.fromCode(validCode);

        // Assert
        expect(result, equals(AppIcon.strongArm));
        expect(result.iconCode, equals(validCode));
      });

      test('should throw ArgumentError for invalid code', () {
        // Arrange
        const String invalidCode = 'invalid_icon';

        // Act & Assert
        expect(
          () => AppIcon.fromCode(invalidCode),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('should handle case-sensitive codes correctly', () {
        // Arrange
        const String uppercaseCode = 'STRONG_ARM';

        // Act & Assert
        expect(
          () => AppIcon.fromCode(uppercaseCode),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('fromPath', () {
      test('should return correct AppIcon from valid path', () {
        // Arrange
        const String validPath = 'assets/emojis/strong_arm.svg';

        // Act
        final AppIcon result = AppIcon.fromPath(validPath);

        // Assert
        expect(result, equals(AppIcon.strongArm));
        expect(result.iconCode, equals('strong_arm'));
      });

      test('should handle paths with different formats', () {
        // Arrange
        const String pathWithSubdirectories = 'some/path/assets/emojis/strong_arm.svg';

        // Act
        final AppIcon result = AppIcon.fromPath(pathWithSubdirectories);

        // Assert
        expect(result, equals(AppIcon.strongArm));
      });

      test('should throw ArgumentError for invalid path', () {
        // Arrange
        const String invalidPath = 'assets/emojis/invalid_icon.svg';

        // Act & Assert
        expect(
          () => AppIcon.fromPath(invalidPath),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('enum values', () {
      test('should have correct asset paths for all icons', () {
        // Arrange & Act
        for (final AppIcon icon in AppIcon.values) {
          // Assert
          expect(
            icon.assetPath,
            equals('assets/emojis/${icon.iconCode}.png'),
          );
        }
      });

      test('should have unique icon codes', () {
        // Arrange
        final Set<String> iconCodes = AppIcon.values.map((AppIcon e) => e.iconCode).toSet();

        // Assert
        expect(iconCodes.length, equals(AppIcon.values.length));
      });
    });
  });
}
