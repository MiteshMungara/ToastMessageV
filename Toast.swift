//
//  Toast.swift
//
//  Created by Olivier Robin on 14/03/2017.
//  Copyright © 2017 www.ormaa.fr - All rights reserved.
//

import Foundation
import UIKit
import Foundation
import AVFoundation

public class ToastObject {
    var toastView:ToastView? = nil//(UIView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 500)) as? ToastView)
    var toastAlpha: CGFloat = 1.5
    var toastDelta: CGFloat = 0.1
    //var toastView = UIView()
}

public class Toast: NSObject {
    
    public static var toastObjects: [ToastObject?] = []
    
    public static var toastTimer: Timer? = nil
    
    public static var topController: UIViewController? = nil
    
    // display a message, during long time
    public static func long(message: String,success: String,failer: String) {
        
        //DispatchQueue.main.async {
        
        let bundle = Bundle(for:self.classForCoder())
//        let toastView = UINib(nibName: "Toast", bundle: bundle) as! ToastView
        let toastView = bundle.loadNibNamed("Toast", owner: nil, options: nil)?.first as? ToastView
        
//        let toastView = UINib(nibName: "Toast", bundle: nil).instantiate(withOwner: self, options: [ : ])[0] as? ToastView
//        let toastView: UIView? = (Bundle.main.loadNibNamed("Toast",
//                                                           owner: nil,
//                                                           options: nil)?.first as! ToastView)
        
//        let bundle = Bundle(for: type(of: self) as! AnyClass)
//        let tableNib = UINib(nibName: "Toast", bundle: bundle)
//        toastView = tableNib.instantiateWithOwner(self, options: nil)[0] as! ToastView

//        let toastView = ToastView.instanceFromNib()
//       let toastView: ToastView = UIView.fromNib()
         //var toastView = ToastView()
        //toastView = CGRect(x: 0, y: 0, width: 320, height: 500)
        topController = getTopController()
        topController?.view.addSubview(toastView!)
        setToastPosition(toastView: toastView!, index: toastObjects.count)
            
        let t = ToastObject()
            t.toastView = toastView
            t.toastAlpha = 1.5
            t.toastDelta = 0.01
            t.toastView?.title.text = message
            if success == "1"
            {
                t.toastView?.imageV.backgroundColor = UIColor.init(red: 41.0/255.0, green: 177.0/255.0, blue: 114/255.0, alpha: 1)
                //t.toastView?.imageV.image = UIImage(named: "toest_success")
            }
            else
            {
              //  t.toastView?.imageV.image = UIImage(named: "toest_failer")
                 t.toastView?.imageV.backgroundColor = UIColor.init(red: 250.0/255.0, green: 93.0/255.0, blue: 93/255.0, alpha: 1)
            }
            if toastTimer == nil {
                toastTimer = Timer.scheduledTimer(timeInterval: TimeInterval(0.025), target: self,
                                                  selector: #selector(self.updateAlpha), userInfo: nil, repeats: true)
            }
            
            toastObjects.append(t)
        }
   // }
    
    // display a message, during long short
   public  static func short(message: String, success: String,failer: String) {
        
        //DispatchQueue.main.async {
            
            let toastView = UINib(nibName: "Toast", bundle: nil).instantiate(withOwner: self, options: [ : ])[0] as? ToastView
            
            topController = getTopController()
            topController?.view.addSubview(toastView!)
            setToastPosition(toastView: toastView!, index: toastObjects.count)
            
            let t = ToastObject()
            t.toastView = toastView
            t.toastAlpha = 1.4
            t.toastDelta = 0.02
            t.toastView?.title.text = message
            if toastTimer == nil {
                toastTimer = Timer.scheduledTimer(timeInterval: TimeInterval(0.025), target: self,
                                                  selector: #selector(self.updateAlpha), userInfo: nil, repeats: true)
            }


if success == "1"
            {
                t.toastView?.imageV.backgroundColor = UIColor.init(red: 41.0/255.0, green: 177.0/255.0, blue: 114/255.0, alpha: 1)
                //t.toastView?.imageV.image = UIImage(named: "toest_success")
            }
            else
            {
              //  t.toastView?.imageV.image = UIImage(named: "toest_failer")
                 t.toastView?.imageV.backgroundColor = UIColor.init(red: 250.0/255.0, green: 93.0/255.0, blue: 93/255.0, alpha: 1)
            }
            if toastTimer == nil {
                toastTimer = Timer.scheduledTimer(timeInterval: TimeInterval(0.025), target: self,
                                                  selector: #selector(self.updateAlpha), userInfo: nil, repeats: true)
            }

            
            
            toastObjects.append(t)
        }
    //}
    
    // get the top controller, in the chain
   public  static func getTopController() -> UIViewController {
        var topController = UIApplication.shared.keyWindow?.rootViewController
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        return topController!
    }
    
    // move the toast message, depending on how many are still displayed
    public static func setToastPosition(toastView: ToastView, index: Int) {
        
        let x = CGFloat((topController?.view.frame.width)! / 2 - 150) // 150 is the half width of the toast message
        var screenHeight = Int(UIScreen.main.bounds.height)
        screenHeight = screenHeight - 100
        toastView.top.constant = CGFloat(screenHeight + index * 50)
        toastView.left.constant = x
        toastView.frame.size = CGSize(width: 0, height: 0)
    }
    
    
    // Called a 1/50e sec.
     @objc public  static func updateAlpha() {
        
        for index in 0...toastObjects.count - 1 {
            let o = toastObjects[index]
            if o != nil {
                let t = o?.toastView
                let alpha = o?.toastAlpha
                let delta = o?.toastDelta
                
                t?.setAlpha(alpha: alpha!)
                o?.toastAlpha = CGFloat(alpha! - delta!)
                
                if o!.toastAlpha <= CGFloat(0.1) {
                    // toast message can be removed
                    t?.removeFromSuperview()
                    toastObjects[index] = nil
                }
            }
        }
        
        purgeToast()
    }
    
    // will remove completed toast message
    public static func purgeToast() {
        
        if toastObjects.count > 0 {
            
            var toastRemoved = false
            for index in 0...toastObjects.count - 1 {
                if toastObjects[index] == nil {
                    toastObjects.remove(at: index)
                    toastRemoved = true
                    break
                }
            }
            if toastRemoved {
                // we need to redo the process, like this :
                // if we delete several object in the loop above, it will crash
                purgeToast()
                return
            }
            
            // move the toast message, like a stack
            //            if toastObjects.count > 0 {
            //                for index in 0...toastObjects.count - 1 {
            //                    if toastObjects[index] != nil {
            //                        setToastPosition(toastView: (toastObjects[index]?.toastView)!, index: index)
            //                    }
            //                }
            //            }
        }
        else {
            toastTimer?.invalidate()
            toastTimer = nil
        }
    }
    
    
    
}
//extension UIView {
//    class func fromNib<ToastView: UIView>() -> ToastView {
//        return Bundle.main.loadNibNamed(String(describing: ToastView.self), owner: nil, options: nil)![0] as! ToastView
//    }
//}

