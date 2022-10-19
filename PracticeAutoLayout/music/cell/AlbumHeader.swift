//
//  File.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/18.
//

import UIKit

final class AlbumHeader: UICollectionReusableView {
  let HStack: UIStackView = {
    let HStack = UIStackView()
    HStack.axis = .horizontal
    HStack.spacing = 10
    HStack.setContentHuggingPriority(.init(rawValue: 252), for: .horizontal)
    HStack.setContentCompressionResistancePriority(.init(rawValue: 751), for: .horizontal)
    return HStack
  }()
  
  let albumArt: UIImageView = {
    let image = UIImageView(image: UIImage(named: "albumArt")!)
    image.layer.cornerRadius = 20
    image.clipsToBounds = true
    return image
  }()
  
  let VStack: UIStackView = {
    let VStack = UIStackView()
    VStack.axis = .vertical
    VStack.spacing = 5
    return VStack
  }()
  
  let artist: UILabel = {
    let title = UILabel()
    title.textColor = .black
    title.numberOfLines = 1
    title.font = .systemFont(ofSize: 18, weight: .bold)
    return title
  }()
  
  let descriptionText: UILabel = {
    let des = UILabel()
    des.textColor = .lightGray
    des.numberOfLines = 1
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
    self.addSubview(HStack)
    HStack.addArrangedSubview(albumArt)
    HStack.addArrangedSubview(VStack)
    VStack.addArrangedSubview(descriptionText)
    VStack.addArrangedSubview(artist)
    
  }
  
  private func setupLayout() {
    HStack.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    albumArt.snp.makeConstraints { make in
      make.size.equalTo(40)
    }
  }
  
  func setupContent(albumArt: UIImage?, descText: String?, artist: String?) {
    self.albumArt.image = albumArt
    self.descriptionText.text = descText
    self.artist.text = artist
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    setupContent(albumArt: nil, descText: nil, artist: nil)
  }
  
}

