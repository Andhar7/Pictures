//
//  ContView.swift
//  Tutorials2
//
//  Created by Andrej Kling on 21.12.20.
//

import SwiftUI

 

// Get Screen size .Instead of using GeometryReader to get the frame, I will use native screen size instead. A child GeometryReader size can get affected by the parent geometry so that it can mess up the proper sizing. This is the preference that I usually used.
struct Screen {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
}

struct ContView: View {
    //MARK: - PROPERTIES
       @State var isExpand = false //1 is used to let anything outside of ForEach, which we will build later on, know that expand animation is happening.
       @State var activeId = UUID() //2  is very important. You can think of this variable work like NavigationLink that helps each item act independently. We won't want to expand every item when only 1 is clicked.
    
    var body: some View {
        ZStack {
               Color(self.isExpand ? UIColor.systemGray2 : .white).edgesIgnoringSafeArea(.all) //3
               
               ScrollView(.vertical, showsIndicators: true) { //4
                   VStack(alignment: .leading, spacing: 0) {
                       Text("SATURDAY, MAY 2")
                           .foregroundColor(Color(UIColor.systemGray))
                       HStack {
                           Text("Today")
                               .font(.system(.title))
                               .fontWeight(.semibold)
                           Spacer()
                           Image("p14")
                           .resizable()
                            .aspectRatio(contentMode: .fill)
                           .frame(width: 45, height: 45)
                           .clipShape(Circle())
                       }
                   }
                   .padding()
                   .shadow(color: Color.black.opacity(0.3), radius: 1, x: 0, y: 1)
                   .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0, y: 10)
                   .blur(radius: 0.2)
                   .opacity(self.isExpand ? 0 : 1)
               
            
            VStack(spacing: 30) {
                ForEach(items) { item in
                    GeometryReader { reader in //1
                        ExpandView(isExpand: self.$isExpand, activeId: self.$activeId, data: item)
                            .offset(y: self.activeId == item.id ? -reader.frame(in: .global).minY : 0) //2
                            .opacity(self.activeId != item.id && self.isExpand ? 0 : 1) // If not current card and expand mode is true, hide it //3
                    }.frame(height: Screen.height * 0.45) //4
                    .frame(maxWidth: self.isExpand ? Screen.width : Screen.width * 0.9)
                }
            }
            .shadow(color: Color.black.opacity(0.3), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0, y: 10)
           
               
            }
            
        }
    }
        @State var items = [
            Item(title: "View Today Post", subTitle: "Learn more and keep learning.", image: "p1", content: "There was something in the tree. It was difficult to tell from the ground, but Rachael could see movement. She squinted her eyes and peered in the direction of the movement, trying to decipher exactly what she had spied. The more she peered, however, the more she thought it might be a figment of her imagination. Nothing seemed to move until the moment she began to take her eyes off the tree. Then in the corner of her eye, she would see the movement again and begin the process of staring again. \n Out of another, I get a lovely view of the bay and a little private wharf belonging to the estate. There is a beautiful shaded lane that runs down there from the house. I always fancy I see people walking in these numerous paths and arbors, but John has cautioned me not to give way to fancy in the least. He says that with my imaginative power and habit of story-making a nervous weakness like mine is sure to lead to all manner of excited fancies and that I ought to use my will and good sense to check the tendency. So I try.\n He sat staring at the person in the train stopped at the station going in the opposite direction. She sat staring ahead, never noticing that she was being watched. Both trains began to move and he knew that in another timeline or in another universe, they had been happy together."),
            Item(title: "Unity Planet", subTitle: "Build the game you always dream of.", image: "p2", content: "There was something in the tree. It was difficult to tell from the ground, but Rachael could see movement. She squinted her eyes and peered in the direction of the movement, trying to decipher exactly what she had spied. The more she peered, however, the more she thought it might be a figment of her imagination. Nothing seemed to move until the moment she began to take her eyes off the tree. Then in the corner of her eye, she would see the movement again and begin the process of staring again. \n Out of another, I get a lovely view of the bay and a little private wharf belonging to the estate. There is a beautiful shaded lane that runs down there from the house. I always fancy I see people walking in these numerous paths and arbors, but John has cautioned me not to give way to fancy in the least. He says that with my imaginative power and habit of story-making a nervous weakness like mine is sure to lead to all manner of excited fancies and that I ought to use my will and good sense to check the tendency. So I try. \n He sat staring at the person in the train stopped at the station going in the opposite direction. She sat staring ahead, never noticing that she was being watched. Both trains began to move and he knew that in another timeline or in another universe, they had been happy together."),
            Item(title: "Firewatch View", subTitle: "Follow your passion, it will guide your life", image: "p3", content: "There was something in the tree. It was difficult to tell from the ground, but Rachael could see movement. She squinted her eyes and peered in the direction of the movement, trying to decipher exactly what she had spied. The more she peered, however, the more she thought it might be a figment of her imagination. Nothing seemed to move until the moment she began to take her eyes off the tree. Then in the corner of her eye, she would see the movement again and begin the process of staring again. \n Out of another, I get a lovely view of the bay and a little private wharf belonging to the estate. There is a beautiful shaded lane that runs down there from the house. I always fancy I see people walking in these numerous paths and arbors, but John has cautioned me not to give way to fancy in the least. He says that with my imaginative power and habit of story-making a nervous weakness like mine is sure to lead to all manner of excited fancies and that I ought to use my will and good sense to check the tendency. So I try.\n He sat staring at the person in the train stopped at the station going in the opposite direction. She sat staring ahead, never noticing that she was being watched. Both trains began to move and he knew that in another timeline or in another universe, they had been happy together."),
            Item(title: "Firewatch View", subTitle: "Follow your passion, it will guide your life", image: "p4", content: "There was something in the tree. It was difficult to tell from the ground, but Rachael could see movement. She squinted her eyes and peered in the direction of the movement, trying to decipher exactly what she had spied. The more she peered, however, the more she thought it might be a figment of her imagination. Nothing seemed to move until the moment she began to take her eyes off the tree. Then in the corner of her eye, she would see the movement again and begin the process of staring again. \n Out of another, I get a lovely view of the bay and a little private wharf belonging to the estate. There is a beautiful shaded lane that runs down there from the house. I always fancy I see people walking in these numerous paths and arbors, but John has cautioned me not to give way to fancy in the least. He says that with my imaginative power and habit of story-making a nervous weakness like mine is sure to lead to all manner of excited fancies and that I ought to use my will and good sense to check the tendency. So I try.\n He sat staring at the person in the train stopped at the station going in the opposite direction. She sat staring ahead, never noticing that she was being watched. Both trains began to move and he knew that in another timeline or in another universe, they had been happy together."),
            Item(title: "Firewatch View", subTitle: "Follow your passion, it will guide your life", image: "p5", content: "There was something in the tree. It was difficult to tell from the ground, but Rachael could see movement. She squinted her eyes and peered in the direction of the movement, trying to decipher exactly what she had spied. The more she peered, however, the more she thought it might be a figment of her imagination. Nothing seemed to move until the moment she began to take her eyes off the tree. Then in the corner of her eye, she would see the movement again and begin the process of staring again. \n Out of another, I get a lovely view of the bay and a little private wharf belonging to the estate. There is a beautiful shaded lane that runs down there from the house. I always fancy I see people walking in these numerous paths and arbors, but John has cautioned me not to give way to fancy in the least. He says that with my imaginative power and habit of story-making a nervous weakness like mine is sure to lead to all manner of excited fancies and that I ought to use my will and good sense to check the tendency. So I try.\n He sat staring at the person in the train stopped at the station going in the opposite direction. She sat staring ahead, never noticing that she was being watched. Both trains began to move and he knew that in another timeline or in another universe, they had been happy together."),
            Item(title: "Firewatch View", subTitle: "Follow your passion, it will guide your life", image: "p6", content: "There was something in the tree. It was difficult to tell from the ground, but Rachael could see movement. She squinted her eyes and peered in the direction of the movement, trying to decipher exactly what she had spied. The more she peered, however, the more she thought it might be a figment of her imagination. Nothing seemed to move until the moment she began to take her eyes off the tree. Then in the corner of her eye, she would see the movement again and begin the process of staring again. \n Out of another, I get a lovely view of the bay and a little private wharf belonging to the estate. There is a beautiful shaded lane that runs down there from the house. I always fancy I see people walking in these numerous paths and arbors, but John has cautioned me not to give way to fancy in the least. He says that with my imaginative power and habit of story-making a nervous weakness like mine is sure to lead to all manner of excited fancies and that I ought to use my will and good sense to check the tendency. So I try.\n He sat staring at the person in the train stopped at the station going in the opposite direction. She sat staring ahead, never noticing that she was being watched. Both trains began to move and he knew that in another timeline or in another universe, they had been happy together."),
            Item(title: "Rocket Man Riding Through The Universe", subTitle: "Nothing better than riding through the universe.", image: "p7", content: "There was something in the tree. It was difficult to tell from the ground, but Rachael could see movement. She squinted her eyes and peered in the direction of the movement, trying to decipher exactly what she had spied. The more she peered, however, the more she thought it might be a figment of her imagination. Nothing seemed to move until the moment she began to take her eyes off the tree. Then in the corner of her eye, she would see the movement again and begin the process of staring again. \n Out of another, I get a lovely view of the bay and a little private wharf belonging to the estate. There is a beautiful shaded lane that runs down there from the house. I always fancy I see people walking in these numerous paths and arbors, but John has cautioned me not to give way to fancy in the least. He says that with my imaginative power and habit of story-making a nervous weakness like mine is sure to lead to all manner of excited fancies and that I ought to use my will and good sense to check the tendency. So I try.\n He sat staring at the person in the train stopped at the station going in the opposite direction. She sat staring ahead, never noticing that she was being watched. Both trains began to move and he knew that in another timeline or in another universe, they had been happy together.")
        ]
    }

struct ContView_Previews: PreviewProvider {
    static var previews: some View {
        ContView()
    }
}
