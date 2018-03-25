//
//  Task.swift
//  TODO
//
//  Created by Marcus Mertilien on 3/20/18.
//  Copyright © 2018 Marcus Mertilien. All rights reserved.
//

import UIKit

//Class is used to define a Task Object
class Task{
    
    var info: String
    var status: Bool
    
    init?(info: String, status: Bool){
        self.info = info
        self.status = status
    }
    init(){
        self.info = ""
        self.status = false
    }
}
