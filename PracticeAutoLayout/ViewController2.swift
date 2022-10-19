//
//  ViewController2.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/17.
//

import UIKit

class ViewController2: UIViewController {
  let label: UILabel = {
    let label = UILabel()
    label.text = "ViewController2"
    label.accessibilityIdentifier = "label2"
    return label
    
  }()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      setupView()
      setupLayout()
    }
    
  
  private func setupView() {
    view.addSubview(label)
  }
  
  
  private func setupLayout() {
    label.snp.makeConstraints { make in
      make.centerX.equalTo(view.snp.centerX)
      make.centerY.equalTo(view.snp.centerY)
    }
  }


}
