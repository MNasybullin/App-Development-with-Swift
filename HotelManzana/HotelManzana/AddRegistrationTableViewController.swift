//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Stomach Diego on 11/5/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    var roomType: RoomType?
    
    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        updateDateViews()
        updateNumberOfGests()
        updateRoomType()
        updateChargesSection()
        if self.registration == nil {
            doneBarButtonItem.isEnabled = false
        } else {
            doneBarButtonItem.isEnabled = true
        }
    }

    func updateDateViews() {
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
        
        let numberOfNights = Calendar.current.dateComponents([.day], from: checkInDatePicker.date, to: checkOutDatePicker.date).day
        numberOfNightsChargesLabel.text = "\(numberOfNights!)"
        updateChargesSection()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row):
            if isCheckInDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row):
            if isCheckOutDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default:
            return 43.5
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row - 1):
            
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            } else {
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
        
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row - 1):
            
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            } else {
                isCheckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    
    func updateNumberOfGests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        // implemented later
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
            doneBarButtonItem.isEnabled = true
        } else {
            roomTypeLabel.text = "No Set"
        }
    }
    
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
        updateChargesSection()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType" {
            let destinationViewController = segue.destination as? SelectedRoomTypeTableViewController
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
    }
    
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    var registration: Registration? {
        
        guard let roomType = roomType else { return nil }
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hasWifi)
    }
    
    
    @IBOutlet weak var numberOfNightsChargesLabel: UILabel!
    @IBOutlet weak var roomTypeChargesLabel: UILabel!
    @IBOutlet weak var wifiChargesLabel: UILabel!
    @IBOutlet weak var totalChargesLabel: UILabel!
    
    func updateChargesSection() {
        var total = 0
        if roomType == nil {
            roomTypeChargesLabel.text = "No Set"
        } else {
            let price = roomType!.price * Int(numberOfNightsChargesLabel.text!)!
            roomTypeChargesLabel.text = "\(roomType!.shortName)     $ \(price)"
            total += price
        }
        if wifiSwitch.isOn == true {
            let price = 10 * Int(numberOfNightsChargesLabel.text!)!
            wifiChargesLabel.text = "Yes     $ \(price)"
            total += price
        } else {
            wifiChargesLabel.text = "No     $ 0"
        }
        totalChargesLabel.text = "$ \(total)"
    }
    
    @IBAction func wifiChangedValue(_ sender: UISwitch) {
        updateChargesSection()
    }
    
}
