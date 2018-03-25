//
//  AddView.swift
//  TODO
//
//  Created by Marcus Mertilien on 3/23/18.
//  Copyright © 2018 Marcus Mertilien. All rights reserved.
//

import UIKit

class AddView:UIViewController {
    var newTask = Task()
    var delegate: addTaskDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var textOut: UITextView!
    
    @IBAction func done(_ sender: Any) {
        if(textOut.hasText){
            let list = ListView()
            newTask.info = textOut.text
            newTask.status = false
            list.list.append(newTask)
        }
    }
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let toDo = segue.destination as! ListView
//        if(textOut.hasText){
//            let newTask = Task(info: textOut!.text, status: true)
//            toDo.list.append(newTask!)
//        }
//    }
    //     func textViewDidEndEditing(_ textView: UITextView){
//        //Resolve Boolean Status
//        let newTask = Task(info: textView.text!, status: true)
//        //ListView.list.append(newTask)
//    }
    
}

protocol addTaskDelegate{
    func addTask()
}
