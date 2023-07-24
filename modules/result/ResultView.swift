//
//  ResultView.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 24/07/23.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        VStack{
            SpacerHeight30()
            HStack{
                TitlePage(title: "Result")
                Spacer()
            }
            SpacerHeight20()
            VStack{
                HStack{
                    LabelMenu(label: "Your Conversation")
                    Spacer()
                }
                SpacerHeight15()
                Text("alalajasbdj sj fj dsj j sdj jdsj  ds  dsk f ds f dsjk cjds j cvjds cjv dsjc dsjk ch jh h  h   j j h h vhh cucvuyfvyvyigisadasdsadasdasdsadlhfsvhv fhsdfj sdhfv dsjhfv ds,jhnfv djhnfb ,dhsnfv xkh jkeruibehriuyenriueyhrniuehreyhrnukeyhcbrxikeyxharuyhxnriuqwyh")
                    .blacktext20()
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
            }
            .padding(16)
            .background(.white)
//            .frame(maxWidth: .infinity)
            .cornerRadius(12)
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color.cnvs)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
