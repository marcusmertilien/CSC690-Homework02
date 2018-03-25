//
//  EditView.swift
//  TODO
//
//  Created by Marcus Mertilien on 3/7/18.
//  Copyright © 2018 Marcus Mertilien. All rights reserved.
//

import UIKit
import os.log


class EditView: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    
    var task: Task?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let task = task{
            textView.text = task.info
        }
    }
    
    override func  didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard (sender as? UIBarButtonItem) != nil else {
            os_log("Something unforseable has gone wrong", log: OSLog.default, type: .debug)
            return
        }
        
        let info = textView.text ?? ""
        let status = false
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        task = Task(info: info, status: status)
    }

    
    @IBAction func Save(_ sender: Any) {
        print("Hello World\n")
        //weak var completition: UISwitch!
       // weak var editInfo: UITextField!
        
        //temp.info = editInfo.text
        //temp.completed = completition.isOn
        //Task(info: "Hello", completed: 1, index: 0)
        //temp.addTask(obj: temp)
        
    }

}
