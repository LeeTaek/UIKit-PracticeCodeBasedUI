//
//  SampleView.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/14.
//

import UIKit

class SampleView: UIView {
  let imageView: UIImageView = UIImageView()
  
  init( color: UIColor) {
    super.init(frame: CGRect.zero)
    addView(color: color)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
//    fatalError("init(coder:) has not been implemented")
  }
  
  
  func addView(color: UIColor) {
    backgroundColor = color
    addSubview(imageView)    
  }

  
}
