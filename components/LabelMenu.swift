//
//  LabelMenu.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 17/07/23.
//

import SwiftUI

struct LabelMenu: View {
    var label: String
    var body: some View {
        HStack{
            Image(systemName: "message.fill")
                .foregroundColor(Color.pinkClr)
                .font(.system(size: 24))
                
            Text(label)
                .pinktext24()
                .fontWeight(.semibold)
                .fontDesign(.rounded)
        }
        
    }
}

struct LabelMenu_Previews: PreviewProvider {
    static var previews: some View {
        LabelMenu(label: "Your Qonversation")
    }
}
