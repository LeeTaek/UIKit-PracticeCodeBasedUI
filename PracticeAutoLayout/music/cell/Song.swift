//
//  Album.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/18.
//

import UIKit

final class Song: UICollectionViewCell {
  let VStack: UIStackView = {
    let VStack = UIStackView()
    VStack.axis = .vertical
    VStack.spacing = 5
    return VStack
  }()
  
  let albumArt: UIImageView = UIImageView()
  
  let title: UILabel = {
    let title = UILabel()
    title.textColor = .white
    title.numberOfLines = 1
    title.font = .systemFont(ofSize: 18, weight: .bold)
    return title
  }()
  
  let descriptionText: UILabel = {
    let des = UILabel()
    des.textColor = .lightGray
    des.font = .systemFont(ofSize: 16)
    return des
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addView()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func addView() {
    self.addSubview(albumArt)
    self.addSubview(VStack)
    
    VStack.addArrangedSubview(title)
    VStack.addArrangedSubview(descriptionText)
  }
  
  private func setupLayout() {
    albumArt.snp.makeConstraints { make in
      make.top.left.equalToSuperview()
      make.size.equalTo(40)
      make.bottom.equalToSuperview().priority(999)
    }
    
    VStack.snp.makeConstraints { make in
      make.left.equalTo(albumArt.snp.right).offset(5)
      make.top.bottom.equalTo(albumArt)
    }
  }
  
  
  func setupContent(albumArt: UIImage?, descText: String?, title: String?) {
    self.albumArt.image = albumArt
    descriptionText.text = descText
    self.title.text = title
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    setupContent(albumArt: nil, descText: nil, title: nil)
  }
  
  
  
}
