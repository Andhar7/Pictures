//
//  TodayItem.swift
//  Tutorials2
//
//  Created by Andrej Kling on 20.12.20.
//

import SwiftUI

struct TodayItem: Codable, Identifiable {
    
    var id: Int
    var title: String
    var category: String
    var overlay: String
    var discription: String
    var contentImage: String
    var logo: String
    
    #if DEBUG
    static let exampleApp = TodayItem(    id : 101,
                                          title : "Forza Street",
                                          category : "Ultimate Street Racing Game",
                                          overlay :  "GAME OF THE DAY",
                                          discription : "Race through the ultimate street racing scene at dizzying speed withthe tap of your finger! Have fun winning the racing car collection of your dreams. Pick an event, choose a lineup of cars from your collection, and start racing for infamy in the first Forza game for mobile.\n\nCOLLECT AND UPGRADE ICONIC CARS\nRace to collect legendary cars at intense speed – from classic muscle to modern sports and retro supercars – turning your garage into a trophy case of iconic racing cars, with all the fun, attention to graphics detail, and speed Forza is known for.\n\nTRUE CINEMATIC RACING\nStreamlined controls focus on the fun - timing your gas, brake, and boost are the keys to victory, as action cams chase the racing adrenaline up close showcasing amazing graphics. The stunning, best in class, 3D visuals bring the action to life while you’re speeding across the asphalt. It’s a fun, new, and wholly unique way to enjoy Forza.\n\nRACE ON YOUR TERMS\nRace your collection of cars anytime, anywhere. Squeeze in a fun, quick one-minute race, or dive into immersive story driven events with multiple paths to victory in the cars you love. New controls let you easily race with the tap of a finger to control your gas, brake, and boost. Forza Street has something fun for you any time you feel like racing at high speed and boosting across the finish line to victory.",
                                          contentImage : "b1",
                                          logo : "l1")
    #endif
}
