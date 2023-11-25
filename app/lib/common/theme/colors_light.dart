part of 'colors.dart';

final class _KMColorsLight extends KMColors {
  const _KMColorsLight();

  @override
  KMColor get primary => const KMColor._(0xFFAA2C69);
  @override
  KMColor get onPrimary => const KMColor._(0xFFFFFFFF);

  @override
  KMColor get secondary => const KMColor._(0xFF008BF8);

  @override
  KMColor get background => const KMColor._(0xFFFFFFFF);

  @override
  KMColor get surface => const KMColor._(0xFFF1F1F1);
  @override
  KMColor get text => const KMColor._(0xFF000000);

  @override
  KMColor get transparent => const KMColor._(0x00000000);

  @override
  KMColor get error => const KMColor._(0xFFB00020);
}
