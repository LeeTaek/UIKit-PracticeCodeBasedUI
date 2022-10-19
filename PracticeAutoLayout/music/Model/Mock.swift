//
//  Mock.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/18.
//

import Foundation
import UIKit

enum Mock {
  static let data = [
    Music.music(
      [
        .init(albumArt: UIImage(named: "GD")!, title: "지디 그 자체", desc: "GD"),
        .init(albumArt: UIImage(named: "showmethemoney")!, title: "국힙원탑", desc: "어느새부터 힙합은 안멋져"),
        .init(albumArt: UIImage(named: "yeoyido")!, title: "여의도", desc: "내 집처럼"),
      ]
    ),
    .song(
      [
        .init(artistImage: UIImage(named: "이찬혁")!, songTitle: "GD", desc: "악동뮤지션")
      ]
    )
  
  
  ]
}
