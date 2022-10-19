//
//  MusicViewController.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/18.
//

import UIKit

class MusicViewController: UIViewController {
  lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setupAlbumLayout())
    collectionView.isScrollEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = true
    collectionView.contentInset = .zero
    collectionView.clipsToBounds = true
    
    collectionView.register(AlbumHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AlbumHeader")
    collectionView.register(Album.self, forCellWithReuseIdentifier: "Album")
    
    return collectionView
  }()
  
  var dataSource = Mock.data
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.dataSource = self
    setupCollectionView()
  }
  

  private func setupCollectionView() {
    self.view.addSubview(collectionView)
    
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  private func setupAlbumLayout() -> UICollectionViewCompositionalLayout {
    UICollectionViewCompositionalLayout{ (section, env) -> NSCollectionLayoutSection? in
        //item
        let itemSize = NSCollectionLayoutSize (
          widthDimension: .fractionalWidth(0.5),
          heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8)
        
        
        // group
        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(0.9),
          heightDimension: .fractionalHeight(0.3)
        )
        let group = NSCollectionLayoutGroup.horizontal(
          layoutSize: groupSize,
          subitems: [item]
        )
        
        
        // header
        let headerSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(0.95),
          heightDimension: .absolute(48)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerSize,
          elementKind: UICollectionView.elementKindSectionHeader,
          alignment: .top
        )
        
      
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        
        return section
      
      
    }
  }
}


extension MusicViewController: UICollectionViewDataSource {
  func collectionVIew(in collectionView: UICollectionView) -> Int {
    return dataSource.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if case let Music.music(musics) = dataSource[section] {
      return musics.count
    } else {
      return 1
    }
    
  }
  
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if case let Music.music(musics) = dataSource[indexPath.section] {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Album", for: indexPath) as! Album
      let item = musics[indexPath.item]
      cell.setupContent(albumArt: item.albumArt, descText: item.desc, title: item.title)
      
      return cell
    }else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Album", for: indexPath) as! Album
      return cell
    }
  }
  
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(
      ofKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: "AlbumHeader",
      for: indexPath
    ) as! AlbumHeader
    
    header.setupContent(albumArt: UIImage(named: "이찬혁"), descText: "GD", artist: "이찬혁")
    
    return header
  }

    
}
  
  





#if DEBUG
import SwiftUI

// Code Previews
struct MusicViewController_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone 12 Pro Max", "iPhone 8"], id: \.self) {
              MusicViewController().toPreview()
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


