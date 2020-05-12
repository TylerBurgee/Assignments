//
//  ViewController.swift
//  Assignments
//
//  Created by Tyler Burgee on 4/20/20.
//  Copyright © 2020 Tyler Burgee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let user_assignments = UserDefaults.standard
    var assignment_array:Any = []
    
    // Text Boxes
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextField!
    @IBOutlet weak var text5: UITextField!
    @IBOutlet weak var text6: UITextField!
    @IBOutlet weak var text7: UITextField!
    @IBOutlet weak var text8: UITextField!
    @IBOutlet weak var date: UITextField!
    
    // Save Button
    @IBAction func save(_ sender: Any) {
        save_assignments()
    }
    
    // Clear Button
    @IBAction func clear(_ sender: Any) {
        clear_assignments()
    }
    
    // User Data Keys
    struct Keys{
        static let assignment1 = "assignment1"
        static let date = "date"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        check_assignments()
        
        self.text1.delegate = self
        self.text2.delegate = self
        self.text3.delegate = self
        self.text4.delegate = self
        self.text5.delegate = self
        self.text6.delegate = self
        self.text7.delegate = self
        self.text8.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    // Save User Input
    func save_assignments() {
        assignment_array = [text1.text, text2.text, text3.text, text4.text, text5.text, text6.text, text7.text, text8.text]
        user_assignments.set(assignment_array, forKey: Keys.assignment1)
        user_assignments.set(date.text, forKey: Keys.date)
    }
    
    // Clear Stored User Data
    func clear_assignments() {
        text1.text = ""
        text2.text = ""
        text3.text = ""
        text4.text = ""
        text5.text = ""
        text6.text = ""
        text7.text = ""
        text8.text = ""
        
        save_assignments()
    }

    // Retrieve Stored User Data
    func check_assignments() {
        if let strings: [String] = user_assignments.stringArray(forKey: Keys.assignment1) ?? [] {
            text1.text = strings[0]
            text2.text = strings[1]
            text3.text = strings[2]
            text4.text = strings[3]
            text5.text = strings[4]
            text6.text = strings[5]
            text7.text = strings[6]
            text8.text = strings[7]
            date.text = user_assignments.object(forKey: Keys.date) as? String
        } else {
            save_assignments()
        }
     }
}
