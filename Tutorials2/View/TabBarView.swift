//
//  TabBarView.swift
//  Tutorials2
//
//  Created by Andrej Kling on 20.12.20.
//

import SwiftUI

struct TabBarView: View {
    
    @Namespace var animation
    @StateObject var detailObject = DetailViewModel()
    
    var body: some View {
    ZStack{
        TabView {
            Today(animation: animation)
                .environmentObject(detailObject)
            .tabItem {
                Image(systemName: "list.bullet")
                Text("List")
            }
            ExpandingView(expandItem: TodayItem.exampleApp)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
           ContView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Cards")
                }
   
        }
        .accentColor(.orange)
        
        // hidden tabBar when detail page opens....
        .opacity(detailObject.show ? 0 : 1)
        
        if detailObject.show {
            Detail(detail: detailObject, animation: animation)
        }
      }
   }
}

 
