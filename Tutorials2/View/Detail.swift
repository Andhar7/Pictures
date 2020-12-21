//
//  Detail.swift
//  Tutorials2
//
//  Created by Andrej Kling on 20.12.20.
//

import SwiftUI

struct Detail: View {
    
    // getting current selected item...
    @ObservedObject var detail : DetailViewModel
    var animation : Namespace.ID
    @State var scale : CGFloat = 1
      
    var body: some View {
    ScrollView{
        VStack{
            // Updated Code For Avoiding Top Scroll
    GeometryReader{reader in
                
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            Image(detail.selectedItem.contentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: detail.selectedItem.contentImage, in: animation)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                HStack{
                    Text(detail.selectedItem.overlay)
                        .font(.system(size: 33, weight: .regular, design: .serif))
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                            detail.show.toggle()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.black.opacity(0.7))
                            .background(Color.white.opacity(0.8))
                            .clipShape(Circle())
                    
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                // since we ignore the top area....
                .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
            }
            .offset(y: (reader.frame(in: .global).minY > 0 && scale == 1) ? -reader.frame(in: .global).minY : 0)
        // Gesture For Closing Detail View....
            .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)).onEnded(onEnded(value:)))
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)

            
            HStack{
                Image(detail.selectedItem.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .cornerRadius(15)
                VStack(alignment: .leading, spacing: 6.0){
                    Text(detail.selectedItem.title)
                        .fontWeight(.bold)
                    Text(detail.selectedItem.category)
                        .font(.caption)
                }
                Spacer(minLength: 0)
                
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("GET")
                            .padding(.vertical,10)
                            .padding(.horizontal,24)
                            .background(Color.primary.opacity(0.1))
                            .clipShape(Capsule())
                    }
                    Text("In App Purchase")
                }
                
            }
            .matchedGeometryEffect(id: detail.selectedItem.id, in: animation)
            .padding()
            
            Text(detail.selectedItem.discription)
            .font(.system(size: 21, weight: .regular, design: .serif))
                .fontWeight(.semibold)
                .padding()
            
            Spacer()
        }
    }
    .scaleEffect(scale)
    .ignoresSafeArea(.all, edges: .top)
}
    func onChanged(value: DragGesture.Value){
        
        // calculating scale value by total height...
        
        let scale = value.translation.height / UIScreen.main.bounds.height
        
        // if scale is 0.1 means the actual scale will be 1- 0.1 => 0.9
        // limiting scale value...
        
        if 1 - scale > 0.75{
        
            self.scale = 1 - scale
        }
    }
    
    func onEnded(value: DragGesture.Value){
        
        withAnimation(.spring()){
            
            // closing detail view when scale is less than 0.9...
            if scale < 0.9{
                detail.show.toggle()
            }
            scale = 1
        }
    }
}
 
