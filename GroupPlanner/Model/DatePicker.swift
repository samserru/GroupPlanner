//
//  DatePicker.swift
//  GroupPlanner
//
//  Created by Joshua Greenberg (student LM) on 3/23/23.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    var approvedDates = [Date]()
    var selectedDates = [Date]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up approved dates
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        approvedDates.append(formatter.date(from: "2023/03/24")!)
        approvedDates.append(formatter.date(from: "2023/03/25")!)
        approvedDates.append(formatter.date(from: "2023/03/26")!)

        // Set up date picker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)

        // Add date picker to view
        view.addSubview(datePicker)
    }

    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date

        // Check if selected date is in the approved dates array
        if approvedDates.contains(selectedDate) {
            // If it is, add it to the selected dates array
            selectedDates.append(selectedDate)
        } else {
            // If it's not, display an error message
            let alert = UIAlertController(title: "Invalid Date", message: "Please select a valid date.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

}

