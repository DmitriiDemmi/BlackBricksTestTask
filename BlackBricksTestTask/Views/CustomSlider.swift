//
//  CustomSlider.swift
//  BlackBricksTestTask
//
//  Created by RM on 22.06.2021.
//

import UIKit

class CustomSlider: UISlider {
  @IBInspectable var trackHeight: CGFloat = 25

  override func trackRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
  }
}
