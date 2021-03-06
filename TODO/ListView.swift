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
    @IBOutlet weak var displaySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadSampleTasks()
        
        if let savedLists = loadTasks() {
            list = savedLists
        }
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
        cell.statusSwitch.isEnabled = false
        cell.statusSwitch.setOn(task.status, animated: true)
        
        saveTasks()
        
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
    
    @IBAction func editUnwind(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? EditView, let task = sourceViewController.task {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                //Update an existing task
                list[selectedIndexPath.row] = task
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                
            }else{
                // Add a new task.
                let newIndexPath = IndexPath(row: list.count, section: 0)
                
                list.append(task)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveTasks()
        }
    }
    
    private func saveTasks(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(list, toFile: Task.ArchiveURL.path)
        if isSuccessfulSave{
            os_log("Tasks successfully saved.", log: OSLog.default,type: .debug)
        } else{
            os_log("Failed to save lists...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadTasks() -> [Task]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Task.ArchiveURL.path) as?
        [Task]
    }
    
    
    
}



