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

/*
 #
 
 Pod::Spec.new do |s|
 s.name             = 'ToastMessageV'
 s.version          = '0.1.0'
 s.summary          = 'ToastMessageV shows short time alert.'
 
 
 # This description is used to generate tags and improve search results.
 #   * Think: What does it do? Why did you write it? What is the focus?
 #   * Try to keep it short, snappy and to the point.
 #   * Write the description between the DESC delimiters below.
 #   * Finally, don't worry about the indent, CocoaPods strips it!
 
 s.description      = <<-DESC
 ToastMessageV shows short time alert. Install library into project, Never have to write this generic code again.
 DESC
 
 s.homepage         = 'https://github.com/MiteshMungara/ToastMessageV'
 # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
 s.license          = { :type => 'MIT', :file => 'LICENSE' }
 s.author           = { 'Mitesh Mungara' => 'mitu1742000@gmail.com' }
 s.source           = { :git => 'https://github.com/MiteshMungara/ToastMessageV.git', :tag => s.version.to_s }
 
 # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
 
 s.ios.deployment_target = '8.0'
 
 s.source_files = 'ToastMessageV/**/*'
 
 # s.resources = 'ToastMessageV/Resources/*.xib'
 # s.resource_bundles = {
 #   'ToastMessageV' => ['ToastMessageV/Resources/*.xib']
 # }
 
 # s.public_header_files = 'Pod/Classes/**/*.h'
 s.frameworks = 'UIKit'
 # s.dependency 'AFNetworking', '~> 2.3'
 end
*/
