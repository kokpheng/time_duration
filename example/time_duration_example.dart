import 'package:time_duration/time_duration.dart';

void main() {
  // Create an object of TimeDuration
  final timeDuration = TimeDuration();

  // Input your times
  // Example: From 11:00 PM -> to 02:09 AM
  timeDuration.computeTime(
    fromHour: 11,
    fromMinute: 0,
    fromPeriod: TimeDurationPeriod.PM,
    toHour: 2,
    toMinute: 9,
    toPeriod: TimeDurationPeriod.AM,
  );

  // => 3 hours
  print(timeDuration.hours);

  // => 9 minutes
  print(timeDuration.minutes);

  // => total time in minutes: 189 minutes
  print(timeDuration.inMinutes);
}
