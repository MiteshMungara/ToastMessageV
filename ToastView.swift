//
//  ToastView.swift
//
//  Created by Olivier Robin on 14/03/2017.
//  Copyright © 2017 www.ormaa.fr - All rights reserved.
//
import Foundation
import UIKit

public class ToastView: UIView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var view: MyView!
    @IBOutlet weak var imageV:UIImageView!
    // used to move the view on the screen
    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var left: NSLayoutConstraint!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "Toast", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! ToastView
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setAlpha(alpha: CGFloat) {
        DispatchQueue.main.async {
            if alpha <= 1.0 {
                self.view.alpha = alpha
            }
            else {
                self.view.alpha = 1.0
            }
        }
    }
    
}
