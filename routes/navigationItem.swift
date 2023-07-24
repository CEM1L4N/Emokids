//
//  navigation_item.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 23/06/23.
//

import Foundation
import SwiftUI

struct NavigationItem: Identifiable, Hashable{
    var id = UUID()
    var title: String
    var icon: String
    var menu: Menu
}

var navigationItems = [
    
    NavigationItem(title: "Home", icon: "Home", menu: .home),

    
]
