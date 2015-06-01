//
//  NSDate+TimeAgo.swift
//  Pod
//
//  Created by Admin on 01/06/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

extension NSDate {
  func timeAgoSinceDate(date: NSDate) -> String {
    let calendar = NSCalendar.currentCalendar()
    let unitFlags = NSCalendarUnit.CalendarUnitSecond | NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitWeekOfYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear
    
    
    let earliest = self.earlierDate(date)
    let latest = (earliest == self) ? date : self
    let components = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: NSCalendarOptions(0))
    
    
    if (components.year >= 2) {
      println("\(components.year) years ago")
      return "\(components.year) years ago"
    }
    
    return "Nei BMW"
  }
}
