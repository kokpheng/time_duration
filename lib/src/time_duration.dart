part of time_duration;

class TimeDurationPeriod {
  final int _value;
  const TimeDurationPeriod._internal(this._value);
  toString() => '$_value';
  int toInt() => _value;

  static const AM = const TimeDurationPeriod._internal(0);
  static const PM = const TimeDurationPeriod._internal(1);
}

class TimeDuration {
  int hours = 0;
  int minutes = 0;
  int get inMinutes => (hours * 60) + minutes;

  void computeTime({int fromHour, int fromMinute, TimeDurationPeriod fromPeriod, int toHour, int toMinute, TimeDurationPeriod toPeriod}) {
    int t1 = 0, t2 = 0, t3 = 0, t4 = 0, t5 = 0;
    int h1 = fromHour, m1 = fromMinute, er3a = fromPeriod.toInt(); // 0 = am, 1 = pm
    int h2 = toHour, m2 = toMinute, er3b = toPeriod.toInt();

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
    this.hours = t4;
    this.minutes = t5;
  }
}
