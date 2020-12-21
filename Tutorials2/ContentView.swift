//
//  ContentView.swift
//  Tutorials2
//
//  Created by Andrej Kling on 20.12.20.
//

import SwiftUI

struct ContentView: View {
    @Namespace var animation
    @StateObject var detailObject = DetailViewModel()
    var body: some View {
        TabBarView()
       // Detail(detail: detailObject, animation: animation)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
