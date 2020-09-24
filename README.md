# time_duration

A simple API to find the hours and minutes between two times.

## Getting Started

To use this plugin, add `time_duration` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### pubspec

pub.dartlang.org: (you can use 'any' instead of a version if you just want the latest always)

```yaml
dependencies:
  time_duration: 0.0.1-beta.1
```

```dart
import 'package:time_duration/time_duration.dart';
```

```dart
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

timeDuration.hours; // -> 3
timeDuration.minutes; // -> 9
timeDuration.inMinutes; // -> 189
```

## Testing

```
flutter test test
```

## Release notes

See CHANGELOG.md
