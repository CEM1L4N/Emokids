//
//  SpacerView.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 07/07/23.
//

import SwiftUI


struct SpacerHeight15: View {
    var body: some View {
        Spacer().frame(height: 15)
    }
}
struct SpacerHeight20: View {
    var body: some View {
        Spacer().frame(height: 20)
    }
}
struct SpacerHeight30: View {
    var body: some View {
        Spacer().frame(height: 30)
    }
}
struct SpacerHeight40: View {
    var body: some View {
        Spacer().frame(height: 40)
    }
}
struct SpacerView_Previews: PreviewProvider {
    static var previews: some View {
        SpacerHeight30()
    }
}
