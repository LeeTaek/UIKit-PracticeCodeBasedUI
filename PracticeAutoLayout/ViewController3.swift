//
//  ViewController3.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/17.
//

import UIKit
import SnapKit

class ViewController3: UIViewController {
  let segmentCotrol: UISegmentedControl = {
    let control = UISegmentedControl(items: ["first", "second"])
    return control
  }()
  
  let firstView: UIView = {
    let view = UIView()
    view.backgroundColor = .orange
    view.layer.cornerRadius = 10
    return view
  }()
  
  let secondView: UIView = {
    let view = UIView()
    view.backgroundColor = .cyan
    view.layer.cornerRadius = 10
    return view
  }()
  
  var shouldHideFirstView: Bool? {
    didSet {
      guard let shouldHideFirstView = shouldHideFirstView else { return }
      self.firstView.isHidden = shouldHideFirstView
      self.secondView.isHidden = !self.firstView.isHidden
    }
  }


  override func viewDidLoad() {
    super.viewDidLoad()
      // Do any additional setup after loading the view.
    setupView()
    setupLayout()
  }
    
  
  func setupView() {
    segmentCotrol.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
    segmentCotrol.selectedSegmentIndex = 0
    didChangeValue(segment: self.segmentCotrol)
    
    view.addSubview(segmentCotrol)
    view.addSubview(firstView)
    view.addSubview(secondView)
  }
  
  
  func setupLayout() {
    segmentCotrol.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().offset(-300)
    }
    
    firstView.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(20)
      make.right.equalToSuperview().offset(-20)
      make.top.equalTo(segmentCotrol.snp.bottom).offset(20)
      make.bottom.equalToSuperview().offset(-100)
    }
    
    secondView.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(20)
      make.right.equalToSuperview().offset(-20)
      make.top.equalTo(segmentCotrol.snp.bottom).offset(20)
      make.bottom.equalToSuperview().offset(-100)
    }
  }

  
  @objc func didChangeValue(segment: UISegmentedControl) {
    self.shouldHideFirstView = segment.selectedSegmentIndex != 0
  }
  
}






#if DEBUG
import SwiftUI

// Code Previews
struct ViewController3_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone 12 Pro Max", "iPhone 8"], id: \.self) {
                ViewController3().toPreview()
                    .previewDevice(PreviewDevice(rawValue: $0))
                    .previewDisplayName($0)
                
            }
        }
    }
}



// ViewController를 SwiftUI의 View()로 사용하기 위한 extenstion
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

#endif


