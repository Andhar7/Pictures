//
//  Today.swift
//  Tutorials2
//
//  Created by Andrej Kling on 20.12.20.
//

import SwiftUI

struct Today: View {
    
    var card = Bundle.main.decode([TodayItem].self, from: "app.json")
 
    var animation : Namespace.ID
    @EnvironmentObject var detail : DetailViewModel
    
    var body: some View {
    ScrollView {
            VStack{
                HStack(alignment: .bottom){
                    VStack(alignment: .leading, spacing: 5){
                        Text("Saturday, 2021")
                        .font(.system(size: 21, weight: .regular, design: .serif))
                        Text("Tomorrow")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                       
                        }
                    Spacer()
                    Button(action: {}) {
                       Image(systemName: "person")
                        .font(.title)
                    }
                }
                .padding()
                .padding(.top,33)
                 
                
                ForEach(self.card) { cards in
                    
                    // Card View ....
                   TodayCardView(items: cards, animation: animation)
                    .onTapGesture {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                            detail.selectedItem = cards
                            detail.show.toggle()
                        }
                    }
                }
            }
            .padding(.bottom)
            .shadow(color: Color.black.opacity(0.3), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0, y: 10)
        }
    .background(Color.primary.opacity(0.06))
    .edgesIgnoringSafeArea(.all)
    }
    
}

