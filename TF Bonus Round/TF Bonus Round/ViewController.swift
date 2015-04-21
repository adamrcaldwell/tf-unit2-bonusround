//
//  ViewController.swift
//  TF Bonus Round
//
//  Created by Adam Caldwell on 4/21/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let cafPickerCoffee = ["Drip Coffee, 4 0z.", "Espresso Drink, 1 Shot", "Espresso Bean"]
    let cafPickerTea = ["Black Tea, 4 oz.", "Green Tea, 4 oz.", "White Tea, 4 oz.", "Chai, 4 oz."]
    let cafPickerSoda = ["Coca Cola, 12 oz.", "Pepsi Cola, 12 oz.", "Dr. Pepper, 12 oz.", "Mountain Dew, 12 oz.", "Red Bull, 8 oz."]
    let cafPickerOther = ["No-Doz", "Penguin Mints", "Rocket Chocolates", "Excedrin"]
    
    var pickerData = [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountStepper.wraps = true
        amountStepper.autorepeat = true
        amountStepper.maximumValue = 100
        caffeineSourcePicker.dataSource = self
        caffeineSourcePicker.delegate = self
        pickerData = cafPickerCoffee
        caffeineSourcePicker.reloadAllComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Functionality when something is selected
    }

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var caffeineSourcePicker: UIPickerView!
    @IBOutlet weak var amountStepper: UIStepper!
    @IBOutlet weak var amountLabel: UILabel!

    @IBAction func indexChanged(sender: UISegmentedControl) {
        amountStepper.value = 0
        amountLabel.text = "0"
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            pickerData = cafPickerCoffee;
            caffeineSourcePicker.reloadAllComponents()
        case 1:
            pickerData = cafPickerTea;
            caffeineSourcePicker.reloadAllComponents()
        case 2:
            pickerData = cafPickerSoda;
            caffeineSourcePicker.reloadAllComponents()
        case 3:
            pickerData = cafPickerOther;
            caffeineSourcePicker.reloadAllComponents()
        default:
            break; 
        }
    }
    
    @IBAction func amountStepperChanged(sender: UIStepper) {
        amountLabel.text = Int(sender.value).description
        // Other functionality from selecting a quantity
    }
    
}

