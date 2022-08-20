//
//  UIView_Extensions.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import Foundation
import UIKit

extension UIView {
    // Add the Corner_Radius property for the View
   @IBInspectable var cornerRadius : CGFloat{
       get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
