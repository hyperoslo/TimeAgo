import Foundation

func NSDateTimeAgoLocalizedStrings(key: String) -> String {
    let bundlePath = NSBundle.mainBundle().bundlePath + "/Frameworks/TimeAgo.framework/NSDateTimeAgo.bundle"
    let bundle = NSBundle(path: bundlePath)
    return NSLocalizedString(key, tableName: "NSDateTimeAgo", bundle: bundle!, comment: "")
}

func isDateInPast (date: NSDate) {
  if (date.compare(NSDate()) == NSComparisonResult.OrderedDescending) {
NSException(name: "NSDate+TimeAgo DateInTheFutureException", reason: "Date the function is being called on has to be in the past or now, but not in the future.", userInfo: nil).raise()
  }
}

public extension NSDate {
    var timeAgo: String {
        isDateInPast(self)
        let now = NSDate()
        let seconds = Int(fabs(timeIntervalSinceDate(now)))
        let minutes = Int(round(Float(seconds) / 60.0))
        let hours = Int(round(Float(minutes) / 60.0))
        let days = Int(round(Float(hours) / 24.0))
        let weeks = Int(round(Float(days) / 7.0))
        let months = Int(round(Float(days) / 30.0))
        let years = Int(round(Float(days) / 365))

        var value: Int!

        if seconds < 5 {
            // Just Now
            return NSDateTimeAgoLocalizedStrings("Just now")
        } else if seconds < 45 {
            // Seconds Ago
            return stringFromFormat("%%d %@seconds ago", withValue: seconds)
        } else if seconds < 90 {
            // A Minute Ago
            return NSDateTimeAgoLocalizedStrings("A minute ago")
        } else if minutes < 45 {
            // Minutes Ago
            return stringFromFormat("%%d %@minutes ago", withValue:minutes)
        } else if minutes < 90 {
            // An Hour Ago
            return NSDateTimeAgoLocalizedStrings("An hour ago")
        } else if hours < 24 {
            // Hours Ago
            return stringFromFormat("%%d %@hours ago", withValue: hours)
        } else if hours < 42 {
            // Yesterday
            return NSDateTimeAgoLocalizedStrings("Yesterday")
        } else if days < 5 {
            // Days Ago
            return stringFromFormat("%%d %@days ago", withValue: days)
        } else if days < 11 {
            // Last Week
            return NSDateTimeAgoLocalizedStrings("Last week")
        } else if days < 30 {
            // Weeks Ago
            return stringFromFormat("%%d %@weeks ago", withValue: weeks)
        } else if days < 45 {
            // Last month
            return NSDateTimeAgoLocalizedStrings("Last month")
        } else if months < 12 {
            // Month Ago
            return stringFromFormat("%%d %@months ago", withValue: months)
        } else if Double(days) < (365 * 1.6) {
            // Last Year
            return NSDateTimeAgoLocalizedStrings("Last Year")
        }
        
        // Years Ago
        return stringFromFormat("%%d %@years ago", withValue: years)
        
    }
    
    func stringFromFormat(format: String, withValue value: Int) -> String {
        
        let localeFormat = String(format: format, getLocaleFormatUnderscoresWithValue(Double(value)))
        
        return String(format: NSDateTimeAgoLocalizedStrings(localeFormat), value)
    }
    
    func getLocaleFormatUnderscoresWithValue(value: Double) -> String {
        
        let localeCode = NSLocale.preferredLanguages().first as! String
        
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