class AppDuration extends Duration {
   AppDuration.veryLowDuration() : super(milliseconds: DurationEnum.verylow.durationValue);
  AppDuration.lowDuration() : super(milliseconds: DurationEnum.low.durationValue);
  AppDuration.normalDuration() : super(milliseconds: DurationEnum.normal.durationValue);
   AppDuration.longDuration() : super(milliseconds: DurationEnum.long.durationValue);
}

enum DurationEnum { verylow, low, normal, long }

extension DurationExtension on DurationEnum {
  int get durationValue {
    switch (this) {
      case DurationEnum.verylow:
        return 150;
      case DurationEnum.low:
        return 250;
      case DurationEnum.normal:
        return 500;
      case DurationEnum.long:
        return 1000;
    }
  }
}
