part of 'colors.dart';

final class _KMColorsDark extends KMColors {
  const _KMColorsDark();

  @override
  KMColor get primary => const KMColor._(0xFF9D2D5F);
  @override
  KMColor get onPrimary => const KMColor._(0xFFFFFFFF);

  @override
  KMColor get secondary => const KMColor._(0xFF0068B8);

  @override
  KMColor get background => const KMColor._(0xFF000000);
  @override
  KMColor get surface => const KMColor._(0xFF222222);

  @override
  KMColor get text => const KMColor._(0xFFFFFFFF);

  @override
  KMColor get transparent => const KMColor._(0x00000000);

  @override
  KMColor get error => const KMColor._(0xFFB00020);
}
