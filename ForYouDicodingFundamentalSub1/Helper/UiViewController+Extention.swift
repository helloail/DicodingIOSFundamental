//
//  UiViewController+Extention.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 17/08/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//
import UIKit
import Foundation

extension UIViewController {
    
    func registerStoryboard(id: String, fromStoryboardId: String = "Main") -> UIViewController {
        return UIStoryboard(name: fromStoryboardId, bundle: nil).instantiateViewController(withIdentifier: id)
    }
    
    func registerNib(id: String, fromStoryboardId: String = "Main") -> UIViewController {
        return UIStoryboard(name: fromStoryboardId, bundle: nil).instantiateViewController(withIdentifier: id)
    }
    
    
    
}

class Utils {
    static func showMessagedCancel (title: String, msg: String, button : String)  {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: button, style: .cancel, handler: nil))
        
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("keyWindow has no rootViewController")
            return
        }
        viewController.present(alert, animated: true, completion: nil)
    
    }
    
}

