//
//  data struct.swift
//  viewPratice
//
//  Created by Jube on 2022/12/22.
//

import Foundation
import UIKit

struct Song {
    let name: String
    let singer: String
    let imageName: String
    var isLike: Bool
    var likeBtnImageName: String {
        get {
            self.isLike ? "heartOn" : "heartOff"
        }
        set {
            isLike = newValue == "heartOn" ? true : false
        }
    }
}

struct Genres {
    let type: String
    let imageName: String
    let color: UIColor
}
