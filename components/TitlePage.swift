//
//  TitlePage.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 24/07/23.
//

import SwiftUI

struct TitlePage: View {
    var title: String
    var body: some View {
        Text(title)
            .blacktext30()
            .fontWeight(.semibold)
            .fontDesign(.rounded)
    }
}

struct TitlePage_Previews: PreviewProvider {
    static var previews: some View {
        TitlePage(title: "Result")
    }
}
