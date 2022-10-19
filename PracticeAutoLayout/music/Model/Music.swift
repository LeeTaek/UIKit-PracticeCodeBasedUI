//
//  Music.swift
//  PracticeAutoLayout
//
//  Created by healthwallet7 on 2022/10/18.
//

import UIKit

enum Music {
  case song([Song])
  case album([Album])
  
  struct Song {
    let artistImage: UIImage
    let songTitle: String
    let desc: String
  }

  struct Album {
    let albumArt: UIImage
    let title: String
    let desc: String
  }
}

