//
//  TodayCardView.swift
//  Tutorials2
//
//  Created by Andrej Kling on 20.12.20.
//

import SwiftUI

struct TodayCardView: View {
    
    var items : TodayItem
    var animation : Namespace.ID
    // getting current scheme color....
    @Environment(\.colorScheme) var color
    
    var body: some View {
        VStack {
            Image(items.contentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: items.contentImage, in: animation)
                .frame(width: UIScreen.main.bounds.width - 31, height: 250)
            HStack{
                
                Image(items.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(items.title)
                        .fontWeight(.bold)
                    
                    Text(items.category)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                VStack{
                    
                    Button(action: {}) {
                        
                        Text("GET")
                            .fontWeight(.bold)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            .background(Color.primary.opacity(0.1))
                            .clipShape(Capsule())
                    }
                    
                    Text("In App Purchases")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .shadow(color: Color.black.opacity(0.3), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0, y: 10)
            }
            .matchedGeometryEffect(id: items.id, in: animation)
            .padding()
 
        }
        .background(color == .dark ? Color.black : Color.white)
        .cornerRadius(15)
        .padding(.horizontal)
        .padding(.top)
    }
}
