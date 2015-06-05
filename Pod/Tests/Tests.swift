import UIKit
import XCTest



class Tests: XCTestCase {

  static let now = NSDate()
  static let calendar = NSCalendar.currentCalendar()
  static let one = -1
  static let many = -5

  
  func testYear() {
    var one = Tests.calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitYear, value: Tests.one, toDate: Tests.now, options: NSCalendarOptions(0))!
    var many = Tests.calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitYear, value: Tests.many, toDate: Tests.now, options: NSCalendarOptions(0))!
    
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    
    XCTAssertTrue(Tests.now.timeAgoSinceDate(one) == dateFormatter.stringFromDate(one))
    XCTAssertTrue(Tests.now.timeAgoSinceDate(many) == dateFormatter.stringFromDate(many))
  }
 


  func testWeek() {
    var one = Tests.calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitWeekOfYear, value: Tests.one, toDate: Tests.now, options: NSCalendarOptions(0))
    var many = Tests.calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitMonth, value: Tests.many, toDate: Tests.now, options: NSCalendarOptions(0))
    
    XCTAssertTrue(Tests.now.timeAgoSinceDate(one!) == "1 month ago")
    XCTAssertTrue(Tests.now.timeAgoSinceDate(many!) == "5 months ago")
  }
  
  
  
  func testDay() {
    var one = Tests.calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: Tests.one, toDate: Tests.now, options: NSCalendarOptions(0))
    var many = Tests.calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: Tests.many, toDate: Tests.now, options: NSCalendarOptions(0))
    
    XCTAssertTrue(Tests.now.timeAgoSinceDate(one!) == "1 day ago")
    XCTAssertTrue(Tests.now.timeAgoSinceDate(many!) == "5 months ago")
  }

}
