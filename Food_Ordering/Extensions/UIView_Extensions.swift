//
//  UIView_Extensions.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import Foundation
import UIKit

extension UIView {
   @IBInspectable var cornerRadius : CGFloat{
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
