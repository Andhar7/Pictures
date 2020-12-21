//
//  ExpandingView.swift
//  Tutorials2
//
//  Created by Andrej Kling on 21.12.20.
//

import SwiftUI

struct ExpandingView: View {
    
    var itemScreen = Bundle.main.decode([TodayItem].self, from: "app.json")
    @State var expandItem : TodayItem
    @State var expStartPoint = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var returnPoint   = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var expShow = false
    @State var expHide = false
    let itemHeight : CGFloat = 500
    let imageHeight : CGFloat = 400
    let Swidth = UIScreen.main.bounds.width - 40
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Ask Yourself")
                        .font(.system(size: 21, weight: .regular, design: .serif))
                        .foregroundColor(.gray)
                        Text("Saturday")
                            .font(.title)
                    }
                    Spacer()
                }.padding(.horizontal).padding(.top).padding(.leading)
                
                ForEach(itemScreen, id: \.id){ item in
                    GeometryReader{ geo -> AnyView in
                        return AnyView(
                        
                            ZStack{
                                Image(item.contentImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: self.Swidth, height: self.itemHeight)
                                    .clipped()
                                    .background(Color.white)
                                    .foregroundColor(.green)
                                Button(action: {
                                    self.expandItem = item
                                    let x = geo.frame(in: .global).minX
                                    let y = geo.frame(in: .global).minY
                                    let thisRect = CGRect(x: x, y: y, width: self.Swidth, height: self.itemHeight)
                                    self.returnPoint = thisRect
                                    self.expStartPoint = thisRect
                                    
                                    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
                                        self.expShow = true
                                        self.expStartPoint = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                                    }
                                    
                                }) {
                                    VStack{
                                        HStack{
                                            
                                            VStack(alignment: .leading){
                                                Text("\(item.title)"
                                                )
                                                    .font(.system(size: 18, weight: .bold, design: .default))
                                                    .foregroundColor(.init(white: 0.8)).opacity(0.6)
                                                Text("\(item.overlay)")
                                                    .font(.system(size: 36, weight: .bold, design: .default))
                                            }.padding()
                                            Spacer()
                                        }
                                        Spacer()
                                        HStack{
                                            
                                            VStack(alignment: .leading){
                                                Text("\(item.discription)")
                                                    .lineLimit(2)
                                                    .font(.system(size: 18, weight: .bold, design: .default))
                                                    .foregroundColor(.init(white: 0.9)).opacity(0.8)
                                                
                                            }.padding()
                                            Spacer()
                                        }
                                    }.frame(width: self.Swidth)
                                }
                            }
                            .cornerRadius(15).foregroundColor(.white)
                            .shadow(color: .init(red: 0.1, green: 0.1, blue: 0.1)
                                , radius: 11 , x: 0, y: 4)
                        )
                    }
                    .background(Color.clear.opacity(0.4))
                        .frame(height:self.itemHeight)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                }.coordinateSpace(name: "forEach")
                
                // ForEach end...
            }
            GeometryReader{geo -> AnyView in
                let item = self.expandItem
                
                return AnyView(
                    
                    ZStack{
                        ScrollView{
                            VStack(spacing:0){
                                ZStack{
                                
                                    Image(item.contentImage)
                                    .resizable()
                                    .scaledToFill()
                                        .offset(y: self.expShow ? 0 : 0)
                                    .frame(width:
                                            self.expShow ? UIScreen.main.bounds.width : self.Swidth
                                        
                                        , height:
                                        self.itemHeight
                                )
                                    .clipped()
                                    
                                    .background(Color.white)
                                    .foregroundColor(Color.green)
                                    .edgesIgnoringSafeArea(.top)
                                
                                VStack{
                                    HStack{
                                        
                                        VStack(alignment: .leading){
                                            Text("\(item.category)")
                                                .font(.system(size: 18, weight: .bold, design: .default))
                                                .foregroundColor(.init(red: 0.8 , green: 0.8, blue: 0.8  )).opacity(1.0)
                                            Text("\(item.title)")
                                                .font(.system(size: 36, weight: .bold, design: .default))
                                                .foregroundColor(.white)
                                        }.padding()
                                        Spacer()
                                    }.offset(y:
                                                self.expShow ? 44 : 0)
                                    Spacer()
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text("\(item.discription)")
                                                .lineLimit(2)
                                                .font(.system(size: 18, weight: .bold, design: .default))
                                                .foregroundColor(.init(red: 0.9, green: 0.9, blue: 0.9)).opacity(0.8)
                                            
                                        }.padding()
                                        Spacer()
                                    }
                                }.frame(width: self.expStartPoint.width)
                            }.frame(height:
                                self.itemHeight
                            ).zIndex(1)
                                Text("\(item.discription)").padding().background(Color.white).frame(
                                    maxHeight: self.expShow ? .infinity : 0)
                            }
                        }
                        .frame(width: self.expStartPoint.width, height: self.expStartPoint.height)
                        .background(Color.clear)
                        .cornerRadius(self.expShow ? 0 : 15 )
                        .animation(.easeInOut(duration: 0.3))
                        .offset(x: self.expStartPoint.minX, y: self.expStartPoint.minY)
                        
                        Button(action: {
                            self.expHide = true
                            self.expStartPoint = self.returnPoint
                            
                            self.expShow = false
                            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
                                self.expHide = false
                            }
                        }){
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.init(white: 0.9))
                                .font(.system(size: 25)).padding()
                                .opacity(self.expShow ? 1 : 0.0)
                                .animation(
                                    Animation.easeInOut(duration: 0.3)
                            )
                            
                        }.offset(x: (UIScreen.main.bounds.width/2) - 30, y: (-1 * UIScreen.main.bounds.height/2) + 60)
                    }
                )
            }.edgesIgnoringSafeArea(.top)
            .opacity(self.expShow ? 1 : 0.0)
                .animation(
                    Animation.easeInOut(duration: 0.05)
                        .delay(self.expHide ? 0.5 : 0)
            )
        }
    }
}

struct ExpandingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingView(expandItem: TodayItem.exampleApp)
    }
}
