//
//  SetCornerTextview.swift
//  Here App
//
//  Created by Shivam Kheterpal on 17/08/17.
//  Copyright © 2017 Toxsl technologies. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class SetCornerTextview: UITextView {
  
  @IBInspectable var cornerRadius: CGFloat = 0.0 {
    didSet {
      setCorner()
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0.0 {
    didSet {
      setCorner()
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    didSet {
      setCorner()
    }
  }
  
  func setCorner() {
    layer.cornerRadius = cornerRadius
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor?.cgColor
  }
  
  override open func prepareForInterfaceBuilder() {
    setCorner()
  }
}
