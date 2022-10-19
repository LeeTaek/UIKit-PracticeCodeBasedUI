//
//  Album.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/19.
//

import UIKit

final class Album: UICollectionViewCell {
  let imageView: UIImageView = UIImageView()
  
  let title: UILabel = {
    let title = UILabel()
    title.numberOfLines = 0
    title.font = .systemFont(ofSize: 18, weight: .bold)
    return title
  }()

  let descriptionText: UILabel = {
    let desc = UILabel()
    desc.numberOfLines = 0
    desc.font = .systemFont(ofSize: 16)
    return desc
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
    self.contentView.addSubview(imageView)
    self.contentView.addSubview(title)
    self.contentView.addSubview(descriptionText)
    
  }
  
  private func setupLayout() {
    imageView.snp.makeConstraints { make in
      make.left.top.equalToSuperview()
      make.height.equalToSuperview().multipliedBy(2.0/3.0)
      make.width.equalToSuperview().multipliedBy(0.9/1.0)
      
    }
    
    title.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(5)
      make.left.right.equalToSuperview()
    }
    
    descriptionText.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom).offset(5)
      make.left.right.equalToSuperview()
    }
  }
  
  func setupContent(albumArt: UIImage?, descText: String?, title: String?) {
    self.imageView.image = albumArt
    descriptionText.text = descText
    self.title.text = title
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    setupContent(albumArt: nil, descText: nil, title: nil)
  }
}
