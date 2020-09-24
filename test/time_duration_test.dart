import 'package:flutter_test/flutter_test.dart';
import 'package:time_duration/time_duration.dart';

void main() {
  test('calculate time', () {
    final timeDuration = TimeDuration();
    timeDuration.computeTime(
      fromHour: 11,
      fromMinute: 0,
      fromPeriod: TimeDurationPeriod.PM,
      toHour: 2,
      toMinute: 9,
      toPeriod: TimeDurationPeriod.AM,
    );

    expect(timeDuration.hours, 3);
    expect(timeDuration.minutes, 9);
    expect(timeDuration.inMinutes, 189);
    // expect(() => timeDuration.addOne(null), throwsNoSuchMethodError);
  });
}
