//
//  ViewController.swift
//  TODO
//
//  Created by Marcus Mertilien on 3/6/18.
//  Copyright © 2018 Marcus Mertilien. All rights reserved.
//

import UIKit
import os.log


class ListView: UITableViewController{
    var temp = Task()
    var list = [Task]()
    var addTask = AddView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleTasks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 1
   }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "taskCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? TaskCell else{
            fatalError("The Dequed cell is not an instance of taskCell.")
        }
        
        let task = list[indexPath.row]

        cell.taskLabel.text = task.info
        cell.statusSwitch.setOn(task.status, animated: true)
        
        return cell
    }
    
    
    
    
    private func loadSampleTasks(){
        
        let task1 = Task(info: "Hello World", status: true)
        let task2 = Task(info: "Finish This Project", status: false)
        let task3 = Task(info: "Making Good Progress.", status: true)
        
        list.append(task1!)
        list.append(task2!)
        list.append(task3!)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "addTask":
            os_log("Adding a new task", log: OSLog.default, type: .debug)
            let addVC =  segue.destination as! AddView
            
            
        case "editTask":
            os_log("Edit a new task", log: OSLog.default, type: .debug)
            let editController =  segue.destination as! EditView
            
            let selectedTaskCell = sender as? TaskCell
            
            let indexPath = tableView.indexPath(for: selectedTaskCell!)
            
            let selectedTask = list[(indexPath?.row)!]
            editController.task = selectedTask
            
            
         default:
            break
        }
    }
    
}



