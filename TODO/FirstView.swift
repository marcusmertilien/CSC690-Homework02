//
//  ViewController.swift
//  TODO
//
//  Created by Marcus Mertilien on 3/6/18.
//  Copyright © 2018 Marcus Mertilien. All rights reserved.
//

import UIKit

class FirstView: UIViewController {

    @IBAction func goButton(_ sender: Any) {
        performSegue(withIdentifier: "firstSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

