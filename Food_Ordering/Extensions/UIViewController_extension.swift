//
//  UIViewController_extension.swift
//  Food_Ordering
//
//  Created by Huy Binh on 20/08/2022.
//

import Foundation
import UIKit

extension UIViewController {
    // return the name of the Controller
    static var identifier: String{
        return String(describing: self)
    }
    // return the instance of ViewController
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
    
}
