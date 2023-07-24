//
//  LabelKeyword.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 17/07/23.
//

import SwiftUI

struct LabelKeyword: View {
    var label: String
    var body: some View {
        HStack{
            Image(systemName: "quote.opening")
                .font(.system(size: 24))
                .foregroundColor(Color.pinkClr)
            Text(label)
                .pinktext24()
                .fontWeight(.medium)
                .fontDesign(.rounded)
        }
    }
}

struct LabelKeyword_Previews: PreviewProvider {
    static var previews: some View {
        LabelKeyword(label: "Parent's Keyword")
    }
}
