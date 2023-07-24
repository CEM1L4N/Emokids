//
//  routePage.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 26/06/23.
//

import SwiftUI

class RoutePage{
    static let instance = RoutePage()
    @ViewBuilder
    func GetRoutes(item: Menu) -> some View{
        switch item {
        case .home:
            HomeView()
        case .recordrunning:
            RecordRunningView()
          case .record:
            RecordView()
            
            
        }
        
    
    }
}
