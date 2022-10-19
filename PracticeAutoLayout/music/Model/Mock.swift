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
    Music.album(
      [
        .init(albumArt: UIImage(named: "GD")!, title: "지디 그 자체", desc: "GD"),
        .init(albumArt: UIImage(named: "showmethemoney")!, title: "국힙원탑", desc: "어느새부터 힙합은 안멋져"),
        .init(albumArt: UIImage(named: "yeoyido")!, title: "여의도", desc: "내 집처럼"),
      ]
    ),
    .song(
      [
        .init(artistImage: UIImage(named: "0")!, songTitle: "구애", desc: "아이유"),
        .init(artistImage: UIImage(named: "1")!, songTitle: "상수역", desc: "검정치마"),
        .init(artistImage: UIImage(named: "2")!, songTitle: "운이 좋았지", desc: "권진아"),
        .init(artistImage: UIImage(named: "3")!, songTitle: "그때로 돌아가", desc: "로이킴"),
        .init(artistImage: UIImage(named: "4")!, songTitle: "고속도로 로맨스", desc: "윤종신"),
        .init(artistImage: UIImage(named: "5")!, songTitle: "사건의 지평선", desc: "윤하"),
        .init(artistImage: UIImage(named: "6")!, songTitle: "파노라마", desc: "이찬혁"),
        .init(artistImage: UIImage(named: "7")!, songTitle: "빨간맛", desc: "레드벨벳"),
        .init(artistImage: UIImage(named: "8")!, songTitle: "Hype Boy", desc: "뉴진스"),
        .init(artistImage: UIImage(named: "9")!, songTitle: "그라데이션", desc: "10cm"),
        .init(artistImage: UIImage(named: "10")!, songTitle: "Attention", desc: "뉴진스")
      ]
    )
  
  
  ]
}
