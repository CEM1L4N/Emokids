//
//  RecordView.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 14/07/23.
//

import SwiftUI

struct RecordView: View {
    @StateObject private var audioHelper = AudioHelper()

    var body: some View {
        VStack{
            VStack{
                HStack{
                    Image(systemName: "waveform")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                    Text("Analyze")
                        .whitetext36()
                        .fontWeight(.semibold)
                }
                Text(audioHelper.recognizedText)
                SpacerHeight20()
               Text("Start Analyzing your conversation with your Toddler")
                    .whitetext24()
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .background(Color.pinkClr)
           
            Spacer()
                ButtonRecord(destination: .recordrunning)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)

        .navigationBarBackButtonHidden(true)
    
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
