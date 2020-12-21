//
//  ExpandView.swift
//  Tutorials2
//
//  Created by Andrej Kling on 21.12.20.
//

import SwiftUI

struct ExpandView: View {
    //MARK: - PROPERTIES
    @Binding var isExpand : Bool //1  //1 and //2 are explained and pass down from the parent.
    @Binding var activeId : UUID //2
    var data : Item //3  is data that will use for each item.
    @State var dragValue = CGSize.zero //1 will be used to get the drag gesture value and set our scale animation.
    
    var body : some View {
        ZStack(alignment: .top) {
            
            // Image section
            Image(data.image) //4  is the thumbnail image that will be used to trigger the animation hence the onTapGesture. Also, we will make the image disappear when the view is expanded. This simply hides it for the scale effect.
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
            .onTapGesture {
                self.isExpand = true
                self.activeId = self.data.id
            }
            .opacity(self.activeId == data.id ? 0 : 1)
            
            // Title section
            HStack { //5  is the styling title section. Since we want it to be top left, we can use a combination of Spacer, HStack, and VStack to get it there. Add some padding to make it stay inside the frame. The opacity works the same way as //4.
                VStack(alignment: .leading, spacing: 0) {
                    Text(data.subTitle)
                        .foregroundColor(Color(UIColor.systemGray))
                        .fontWeight(.semibold)
                    
                    Text(data.title)
                        .font(.system(.title))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }.padding()
            .opacity(self.activeId == data.id ? 0 : 1)
            
            // Over lay content
            ZStack { //1
                Color.white.edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        Image(data.image)
                            .resizable()
                            .frame(maxHeight: Screen.height * 0.45)
                        
                        Text(data.content)
                            .foregroundColor(.black)
                            .padding()
                    }.padding(.bottom)
                }.edgesIgnoringSafeArea(.all)
                
                // Making close button
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.isExpand = false
                            self.activeId = UUID()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(Color.white.opacity(0.2))
                        }.frame(width: 30, height: 30)
                        .background(
                            Circle().foregroundColor(Color.white.opacity(0.6))
                        )
                    }.padding(.top, 30)
                    
                    Spacer()
                }.padding()
            }.opacity(self.activeId == data.id ? 1 : 0)
            .gesture(
                           self.activeId == data.id ? //2 We only want to activate gesture when the view is expanded. Also unless the translation value is above 200, the drag gesture won't do anything onChanged. I also place a restriction
                               DragGesture().onChanged({ value in
                               guard value.translation.height < 200 else {return}
                                   if value.translation.height > 400 { //3 that close the expanded view after it passes a value of 400. onEnded is optional but what if I only drag in the range of 200-400, I want anything above 300 to be close the expand view when I release my finger.
                                       self.isExpand = false
                                       self.activeId = UUID()
                                       self.dragValue = .zero
                                   } else {
                                       self.dragValue = value.translation
                                   }
                               }).onEnded({ value in
                                   if value.translation.height > 300 {
                                       self.isExpand = false
                                       self.activeId = UUID()
                                   }
                                       self.dragValue = .zero
                               }) : nil
                       )
                       .scaleEffect(1 - (self.dragValue.height / 1000)) //4  the dragValue will usually be in the hundreds so I want to divide it by 1000 to make it within the range of 0-1, which in our case will never be 1000 because be set our limit of 400 above.
            
        }// ZStack
            .frame(height: self.activeId == self.data.id ? Screen.height : Screen.height * 0.45) //6  is the part that allows the view to expand to full screen on active, else size for it will be at Screen.height * 0.45. Don't use maxHeight here because this gives the view an option to not take up the whole screen.
            .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.6))
            .edgesIgnoringSafeArea(.all)
    }
}

 
