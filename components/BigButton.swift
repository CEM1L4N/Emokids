//
//  BigButton.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 28/06/23.
//

import SwiftUI

struct BigButton: View {
    var label: String
    var body: some View {
        
        Text(label)
            .whitetext24()
            .fontWeight(.semibold)
            .fontDesign(.rounded)
            .frame(width: 358, height: 52)
            .background(Color.pinkClr)
            .cornerRadius(8)
    }
}

struct BigButton_Previews: PreviewProvider {
    static var previews: some View {
        BigButton(label: "Save")
    }
}
