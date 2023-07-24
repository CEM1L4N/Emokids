//
//  ButtonPlay.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 14/07/23.
//

import SwiftUI

struct ButtonRecord: View {
    var destination: Menu
    var body: some View {
        NavigationLink(value: destination){
            Image(systemName: "mic.fill")
                .font(.system(size: 76))
                .foregroundColor(.white)
                .background(Circle().fill(Color.pinkClr)
                    .frame(width: 200, height: 200))
        }
        }
}

//struct ButtonRecord_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonRecord(,)
//    }
//}
