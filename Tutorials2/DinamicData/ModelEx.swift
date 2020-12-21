//
//  ModelEx.swift
//  Tutorials2
//
//  Created by Andrej Kling on 21.12.20.
//

import Foundation

struct Item : Identifiable {
    var id = UUID()
    var title : String
    var subTitle : String
    var image : String
    var content : String
}
