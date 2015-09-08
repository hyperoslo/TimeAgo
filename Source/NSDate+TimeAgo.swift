import Foundation

func NSDateTimeAgoLocalizedStrings(key: String) -> String {
  return NSLocalizedString(key, comment: "")
}

func isInTheFuture(date: NSDate) -> Bool {
  if (date.compare(NSDate()) == NSComparisonResult.OrderedDescending) {
    return true
  }
  return false
}

public extension NSDate {
  var timeAgo: String {

    if isInTheFuture(self) {
      return NSDateTimeAgoLocalizedStrings("Just now")
    }

    let now = NSDate()
    let seconds = Int(fabs(timeIntervalSinceDate(now)))
    let minutes = Int(round(Float(seconds) / 60.0))
    let hours = Int(round(Float(minutes) / 60.0))

    if seconds < 5 {
      return NSDateTimeAgoLocalizedStrings("Just now")
    } else if seconds < 60 {
      return stringFromFormat("%%d %@seconds ago", withValue: seconds)
    } else if seconds < 120 {
      return NSDateTimeAgoLocalizedStrings("A minute ago")
    } else if minutes < 60 {
      return stringFromFormat("%%d %@minutes ago", withValue:minutes)
    } else if minutes < 120 {
      return NSDateTimeAgoLocalizedStrings("An hour ago")
    } else if hours < 24 {
      return stringFromFormat("%%d %@hours ago", withValue: hours)
    } else if hours < 24 * 7 {
      let formatter = NSDateFormatter()
      formatter.dateFormat = "EEEE 'at' hh:mm"
      return formatter.stringFromDate(now)
    } else {
      let formatter = NSDateFormatter()
      formatter.dateFormat = "MMM d 'at' hh:mm"
      return formatter.stringFromDate(now)
    }
  }

  func stringFromFormat(format: String, withValue value: Int) -> String {
    let localeFormat = String(
      format: format,
      getLocaleFormatUnderscoresWithValue(Double(value)))

    return String(format: NSDateTimeAgoLocalizedStrings(localeFormat), value)
  }

  func getLocaleFormatUnderscoresWithValue(value: Double) -> String {
    let localeCode = NSLocale.preferredLanguages().first!

    if localeCode == "ru" {
      let XY = Int(floor(value)) % 100
      let Y = Int(floor(value)) % 10

      if Y == 0 || Y > 4 || (XY > 10 && XY < 15) {
        return ""
      }

      if Y > 1 && Y < 5 && (XY < 10 || XY > 20) {
        return "_"
      }

      if Y == 1 && XY != 11 {
        return "__"
      }
    }

    return ""
  }
}
