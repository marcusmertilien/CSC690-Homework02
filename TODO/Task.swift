//
//  Task.swift
//  TODO
//
//  Created by Marcus Mertilien on 3/20/18.
//  Copyright © 2018 Marcus Mertilien. All rights reserved.
//

import UIKit
import os.log

//Class is used to define a Task Object
class Task: NSObject, NSCoding{
    
    required convenience init?(coder aDecoder: NSCoder){
        guard let info = aDecoder.decodeObject(forKey: PropertyKey.info) as? String
            else{
                os_log("Unable to decode the info for a task object", log: OSLog.default, type: .debug)
                return nil
        }
        let status =  aDecoder.decodeObject(forKey: PropertyKey.status)
        
        self.init(info:info, status:(status != nil))
    }
    
    struct PropertyKey{
        static let info = "text"
        static let status = "bool"
    }
    
    var info: String
    var status: Bool
    
    init?(info: String, status: Bool){
        self.info = info
        self.status = status
    }
    override init(){
        self.info = ""
        self.status = false
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(info, forKey: PropertyKey.info)
        aCoder.encode(status, forKey: PropertyKey.status)
    }
    
    //Mark: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("tasks")
}
