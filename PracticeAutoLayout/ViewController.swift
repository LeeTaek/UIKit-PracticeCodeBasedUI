//
//  ViewController.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/14.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  private let label: UILabel = {
    let label = UILabel()
    label.text = "코드 베이스 뷰"
    label.sizeToFit()
    label.font = .preferredFont(forTextStyle: .headline)
    label.textColor = .label
    return label
  }()
  
  let sampleViews: [SampleView] = {
    var views = [SampleView]()
    let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .link, .purple]
    colors.forEach{ color in
      let sampleView = SampleView(color: color)
      views.append(sampleView)
    }
    
    return views
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad() 
    // Do any additional setup after loading the view.
    addView()
    setupLayout()
  }
  
  
  func addView() {
    sampleViews.forEach{
      view.addSubview($0)
    }
  }
  
  func setupLayout() {
    var xPosition: CGFloat = 0
    var yPosition: CGFloat = 0
    let width: CGFloat = (view.frame.width / 4)
    
    sampleViews.forEach{ sampleView in
      sampleView.snp.makeConstraints { make in
        make.size.width.height.equalTo(width)
        make.left.equalTo(xPosition)
        make.top.equalTo(yPosition)
        
        if xPosition < (view.frame.width/4) * 3 {
          xPosition += width
        } else {
          xPosition = 0
          yPosition += width
        }
      }
    }
  }
  
}



#if DEBUG
import SwiftUI

// Code Previews
struct ViewController_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone 12 Pro Max", "iPhone 8"], id: \.self) {
                ViewController().toPreview()
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
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
    
}

#endif


