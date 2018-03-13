//
//  ListBrain.swift
//  TODO
//
//  Created by Marcus Mertilien on 3/7/18.
//  Copyright © 2018 Marcus Mertilien. All rights reserved.
//

import Foundation

//Global Index Count
private var indexCount = 0;

//Array to hold list of tasks
private var list = [Task] ()


//Structure for recording tasks
struct Task{
    
    private var index = indexCount
    
    var info:String?
    var completed:Bool?
    
    


    mutating func addTask(obj: Task){
        indexCount = indexCount + 1
        list.append(obj)
    }

     func removeTask(obj: Task){
        list.remove(at: obj.getItemIndex())
    }

    func getIndexCount()->Int{
        return indexCount
    }
    
    func getItemIndex()->Int{
        return index
    }
    
}




