//
//  ViewController.swift
//  ToastMessageV
//
//  Created by ishusuvagia@gmail.com on 04/20/2018.
//  Copyright (c) 2018 ishusuvagia@gmail.com. All rights reserved.
//

import UIKit
import ToastMessageV
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func successBtnPRessed(sender:UIButton)
    {
        Toast.long(message:"success", success: "1", failer: "0")
    }
    
    @IBAction func failerBtnPRessed(sender:UIButton)
    {
         Toast.long(message:"failer", success: "0", failer: "1")
    }
}


