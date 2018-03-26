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
        
        textView.delegate = self as? UITextViewDelegate
        
        //updateSaveButton()
        
        if let task = task{
            textView.text = task.info
        }
    }
    
    override func  didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func textFieldDidBeginEditing(_ textView: UITextView){
        //Disable the Save button while editing.
        save.isEnabled = false
    }
    private func textFieldDidEndEditing(_ textField: UITextView) {
        updateSaveButton()
        navigationItem.title = textField.text
    }
    private func textFieldShouldReturn(_ textView: UITextView) -> Bool {
        // Hide the keyboard.
        textView.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === save else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        
        guard (sender as? UIBarButtonItem) != nil else {
            os_log("Something unforseable has gone wrong", log: OSLog.default, type: .debug)
            return
        }
        
        let info = textView.text ?? ""
        let status = false
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        task = Task(info: info, status: status)
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        //dismiss(animated: true, completion: nil)
        
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }

    
    private func updateSaveButton(){
        //Disarm the save button if the text field is empty
        let text = textView.text ?? ""
        save.isEnabled = !text.isEmpty
    }


}
