//
//  SmallButton.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 09/07/23.
//

import SwiftUI

struct SmallButton: View {
    var destination: Menu
    var label: String
    var body: some View {
        NavigationLink(value: destination){
            Text(label)
                .foregroundColor(.white)
                .frame(width: 150, height: 48)
                .background(.blue)
                .cornerRadius(8)
        }
    }
}

//struct SmallButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SmallButton(
//            destination: .reflection,
//            label: "sss")
//    }
//}
