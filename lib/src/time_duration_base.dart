part of time_duration;

/// An Enum of period represents in AM or PM.
class TimeDurationPeriod {
  /// The value for private.
  final int _value;
  const TimeDurationPeriod._internal(this._value);

  /// Return value in integer.
  int toInt() => _value;

  /// The AM constant.
  ///
  /// The value is 0 in integer.
  static const AM = TimeDurationPeriod._internal(0);

  /// The PM constant.
  ///
  /// The value is 1 in integer.
  static const PM = TimeDurationPeriod._internal(1);

  @override
  String toString() => '$_value';
}

/// A class used to calculate duration of two times "From:" and "To:".
class TimeDuration {
  /// The number of hours.
  ///
  /// This will start from 0.
  int hours = 0;

  /// The number of minutes.
  ///
  /// This will start from 0.
  int minutes = 0;

  /// The number of total time in minutes.
  ///
  /// The formula is  (hours * 60) + minutes
  int get inMinutes => (hours * 60) + minutes;

  /// Calculate hours and minutes.
  ///
  /// The following arguments must not be null:
  ///
  /// The first three parameters are earlier or start time information at "From:"
  /// * [fromHour] define From Hours (must be a positive number between 1 and 12 or zero (0)).
  /// * [fromMinute] define From Minutes (must be a positive number between 1 and 59 or zero (0)).
  /// * [fromPeriod] define From Period (must be a TimeDurationPeriod Enum AM or PM).
  ///
  /// The following other three parameters are later or end time information at "To:"
  /// * [toHour] define To Hours (must be a positive number between 1 and 12 or zero (0)).
  /// * [toMinute] define To Minutes (must be a positive number between 1 and 59 or zero (0)).
  /// * [toPeriod] define To Period (must be a TimeDurationPeriod Enum AM or PM).
  ///
  void computeTime(
      {int fromHour,
      int fromMinute,
      TimeDurationPeriod fromPeriod,
      int toHour,
      int toMinute,
      TimeDurationPeriod toPeriod}) {
    // ignore: omit_local_variable_types
    int t1 = 0, t2 = 0, t3 = 0, t4 = 0, t5 = 0;
    // ignore: omit_local_variable_types
    int h1 = fromHour,
        m1 = fromMinute,
        er3a = fromPeriod.toInt(); // 0 = am, 1 = pm
    // ignore: omit_local_variable_types
    int h2 = toHour, m2 = toMinute, er3b = toPeriod.toInt(); // 0 = am, 1 = pm

    if ((er3a == 0) && (h1 == 12)) h1 = 0;

    if ((er3a == 0) && (er3b == 1)) {
      t1 = (60 * h1) + m1;
      if (h2 == 12) {
        t2 = ((h2) * 60) + m2;
      } else {
        t2 = ((h2 + 12) * 60) + m2;
      }
      t3 = t2 - t1;
      t4 = (t3 / 60).floor();
      t5 = t3 - (t4 * 60);
    } else if ((er3a == 1) && (er3b == 0)) {
      if (h2 == 12) h2 = 0;
      if (h1 == 12) h1 = 0;

      t1 = (60 * h1) + m1;
      t2 = ((h2 + 12) * 60) + m2;
      t3 = t2 - t1;
      t4 = (t3 / 60).floor();
      t5 = t3 - (t4 * 60);
    } else if ((er3a == 0) && (er3b == 0)) {
      t1 = (h1 * 60) + m1;

      if (h2 == 12) h2 = 0;

      t2 = (h2 * 60) + m2;
      if (t2 > t1) {
        t3 = t2 - t1;
        t4 = (t3 / 60).floor();
        t5 = t3 - (t4 * 60);
      } else {
        t2 = ((h2 + 24) * 60) + m2;
        t3 = t2 - t1;
        t4 = (t3 / 60).floor();
        t5 = t3 - (t4 * 60);
      }
    } else if ((er3a == 1) && (er3b == 1)) {
      if (h1 != 12) h1 = h1 + 12;
      if (h2 != 12) h2 = h2 + 12;

      t1 = (h1 * 60) + m1;
      t2 = (h2 * 60) + m2;
      if (t2 > t1) {
        t3 = t2 - t1;
        t4 = (t3 / 60).floor();
        t5 = t3 - (t4 * 60);
      } else {
        t2 = ((h2 + 24) * 60) + m2;
        t3 = t2 - t1;
        t4 = (t3 / 60).floor();
        t5 = t3 - (t4 * 60);
      }
    }
    hours = t4;
    minutes = t5;
  }
}
