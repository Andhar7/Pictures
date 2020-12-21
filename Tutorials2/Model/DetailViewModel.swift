//
//  DetailViewModel.swift
//  Tutorials2
//
//  Created by Andrej Kling on 21.12.20.
//

import SwiftUI

class  DetailViewModel: ObservableObject{
    
    @Published var selectedItem = TodayItem.exampleApp
    @Published var show = false

}
