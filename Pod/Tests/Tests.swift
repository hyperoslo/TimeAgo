import UIKit
import XCTest



class Tests: XCTestCase {

//  func testFailing() {
//    let ofCourse = true
//    XCTAssertEqual(ofCourse, false)
//  }
  
  func testyear() {
    let now = NSDate()
    let randomYear = Int(arc4random_uniform(10)) + 2
    var yearsAgo = now.dateByAddingTimeInterval(-60 * 60 * 24 * 370 * Double(randomYear))
    let bool = (now.timeAgoSinceDate(yearsAgo) == "\(randomYear) years ago")
    XCTAssertEqual(bool, true)
  }
  

}
