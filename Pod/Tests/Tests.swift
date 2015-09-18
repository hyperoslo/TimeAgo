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
    let minutes: NSTimeInterval = 15
    XCTAssertEqual(testString(minutes*60), String(format: "%d minutes ago", Int(minutes)))
  }

  func testHoursAgo() {
    let hours: NSTimeInterval = 8
    XCTAssertEqual(testString(hours*3600), String(format: "%d hours ago", Int(hours)))
  }

  func testString(time: NSTimeInterval) -> String {
    let timeAgo = NSDate(timeIntervalSinceNow: -time)
    let timeAgoString = timeAgo.timeAgo

    return timeAgoString
  }
}
