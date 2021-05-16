import 'package:my_mama/dataModels.dart';

// get today schedule
List<Activity> today_schedule(List<ConfigActivity> configs) {
  List<Activity> fixed = [];
  List<ConfigActivity> to_do = [];

  var today = DateTime.now().weekday - 1;

  // separate into two lists
  for (ConfigActivity c in configs) {
    if (c is ConfigFixedActivity) {
      for (int i = 0; i < c.whenDia.length; i++) {
        if (c.whenDia[i] == today) {
          fixed.add(Activity(config: c, start: c.whenMinut[i]));
        }
      }
    } else if (c is ConfigFixedActivityFreeHour) {
      for (int i = 0; i < c.whenDia.length; i++) {
        if (c.whenDia[i] == today) {
          to_do.add(c);
        }
      }
    } else if (c is ConfigActivityOneTime) {
      if (c.whenDia == today) fixed.add(Activity(config: c, start: c.whenMinut));
    }
  }

  // sort the lists
  fixed.sort((Activity a, Activity b) => a.start.compareTo(b.start));
  to_do.sort((ConfigActivity a, ConfigActivity b) => b.span.compareTo(a.span));

  // assign start to to-do's

  for (ConfigActivity c in to_do) {
    for (var i = 0; i < fixed.length; i++) {
      int s, f;
      if (i == 0) {
        s = 8 * 60;
      } else {
        s = fixed[i - 1].start + fixed[i - 1].config.span;
      }

      if (i == fixed.length - 1) {
        f = 22 * 60;
      } else {
        f = fixed[i + 1].start;
      }

      if (s + c.span <= f) {
        fixed.insert(i + 1, Activity(config: c, start: s));
        break;
      }
    }
  }
  return fixed;
}

// Call My Mama
// Si no hi caben les tasques, no les posa :D
// params:
//    - configs: list with all ConfigActivity
//    - to_do: list of all ConfigActivityFreeHour
List<Activity> callMyMama(
    List<ConfigActivity> configs, List<ConfigActivityFreeHour> to_do) {
  List<Activity> fixed = today_schedule(configs);

  to_do.sort((ConfigActivityFreeHour a, ConfigActivityFreeHour b) =>
      b.span.compareTo(a.span));

  for (ConfigActivityFreeHour c in to_do) {
    for (var i = 0; i < fixed.length; i++) {
      int s, f;
      if (i == 0) {
        s = 8 * 60;
      } else {
        s = fixed[i - 1].start + fixed[i - 1].config.span;
      }

      if (i == fixed.length - 1) {
        f = 22 * 60;
      } else {
        f = fixed[i + 1].start;
      }

      if (s + c.span <= f) {
        fixed.insert(i + 1, Activity(config: c, start: s));
        break;
      }
    }
  }
  return fixed;
}
