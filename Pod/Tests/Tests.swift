import UIKit
import XCTest

class Tests: XCTestCase {

  func testJustNow() {
    let now = NSDate()
    let justNowString = now.timeAgo

    XCTAssertEqual(justNowString, "Just now")
  }

  func testSecondsAgo() {
    let seconds: NSTimeInterval = 10
    XCTAssertEqual(testString(seconds), String(format: "%d seconds ago", Int(seconds)))
  }

  func testMinutesAgo() {
    let minutes: NSTimeInterval = 15*60
    XCTAssertEqual(testString(minutes), String(format: "%d minutes ago", Int(minutes)))
  }

  func testHoursAgo() {
    let hours: NSTimeInterval = 7.5*3600
    XCTAssertEqual(testString(hours), String(format: "%d hours ago", Int(hours)))
  }

  func testDaysAgo() {
    let hours: NSTimeInterval = 7.5*3600
    XCTAssertEqual(testString(hours), String(format: "%d hours ago", Int(hours)))
  }

  func testMonthsAgo() {
    let hours: NSTimeInterval = 7.5*3600
    XCTAssertEqual(testString(hours), String(format: "%d hours ago", Int(hours)))
  }

  func testString(secondsAgo: NSTimeInterval) -> String {
    let timeAgo = NSDate(timeIntervalSinceNow: -secondsAgo)
    let timeAgoString = timeAgo.timeAgo

    return timeAgoString
  }
}
