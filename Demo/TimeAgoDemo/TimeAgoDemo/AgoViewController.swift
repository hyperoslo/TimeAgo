import UIKit
import TimeAgo

class AgoViewController: UIViewController {
  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var timePicker: UIDatePicker!
  @IBOutlet weak var datePicker: UIDatePicker!
  
  @IBAction func pickerValueChanged() {
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
    let dateComponents = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: datePicker.date)
    let timeComponents = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: timePicker.date)
    
    let combinedComponents = NSDateComponents()
    combinedComponents.year = dateComponents.year
    combinedComponents.month = dateComponents.month
    combinedComponents.day = dateComponents.day
    combinedComponents.hour = timeComponents.hour
    combinedComponents.minute = timeComponents.minute
    combinedComponents.second = timeComponents.second
    
    let fullDate = calendar.dateFromComponents(combinedComponents)
    dateLabel.text = fullDate?.timeAgo
  }
}