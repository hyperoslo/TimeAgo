import UIKit
import TimeAgo

class AgoViewController: UIViewController {
  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var timePicker: UIDatePicker!
  @IBOutlet weak var datePicker: UIDatePicker!
  
  @IBAction func pickerValueChanged(sender: UIDatePicker) {
    if isToday(datePicker.date) {
      timePicker.maximumDate = NSDate()
    } else {
      timePicker.maximumDate = nil
    }
    calculateTimeAgoString()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dateLabel.text = "Just now"
    timePicker.maximumDate = NSDate()
    datePicker.maximumDate = NSDate()
  }
  
  func calculateTimeAgoString() {
    let calendar = NSCalendar.currentCalendar()
    let dateComponents = calendar.components([.Year, .Month, .Day], fromDate: datePicker.date)
    let timeComponents = calendar.components([.Hour, .Minute, .Second], fromDate: timePicker.date)
    
    let combinedComponents = NSDateComponents()
    combinedComponents.year = dateComponents.year
    combinedComponents.month = dateComponents.month
    combinedComponents.day = dateComponents.day
    combinedComponents.hour = timeComponents.hour
    combinedComponents.minute = timeComponents.minute
    combinedComponents.second = timeComponents.second
    
    dateLabel.text = calendar.dateFromComponents(combinedComponents)?.timeAgo
  }
  
  func isToday (date: NSDate) -> Bool {
    let calendar = NSCalendar.currentCalendar()
    let today = calendar.dateFromComponents(
      calendar.components([.Year, .Month, .Day], fromDate: NSDate()))
    
    let dateToCompare = calendar.dateFromComponents(
    calendar.components([.Year, .Month, .Day], fromDate: date))

    if today == dateToCompare {
      return true
    }
    return false
  }
}