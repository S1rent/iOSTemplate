//
//  UIView+Extension.swift
//  iOSTemplate
//
//  Created by Phillip MacBook Pro on 31/07/24.
//

import Foundation
import UIKit

extension UIView {
    static var identifier: String {
            return String(describing: self)
        }
        
        static var nib: UINib {
            return UINib(nibName: self.identifier, bundle: nil)
        }
}
