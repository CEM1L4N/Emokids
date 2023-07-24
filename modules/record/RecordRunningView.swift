//
//  RecordRunningView.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 19/07/23.
//

import SwiftUI

struct RecordRunningView: View {
    @StateObject private var audioHelper = AudioHelper()
    @StateObject private var nlpHelper = NLPHelper()
    let analyzeTimer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    
//    @State var selectedKeyword: KeywordSuggestion?
//    @State var selectedSuggestion: String = ""

    var body: some View {
        VStack{
            SpacerHeight30()
        Text("Recording...")
            .pinktext24()
            .fontWeight(.semibold)
            .fontDesign(.rounded)
//            Text(audioHelper.recognizedText)
//                .foregroundColor(.black)
            
            VStack{
                
                  
                WaveformWidget(destination:.record )
                  
//                        .onAppear{
//                            audioHelper.startRecording()
//                            print("start")
//                        }
                    
                
                
            }
                .frame(height: 250)
            
            TagKeyword(tags: nlpHelper)
//            HStack{
//                ForEach(nlpHelper.foundNouns, id: \.self){ word in
//
//                    Text(word)
//
//                }
//            }
            
            SpacerHeight20()
          
//                ForEach(nlpHelper.foundNouns, id: \.self) { selectedKeyword in
//                                let suggestions = keywordSuggestions.first { $0.keyword == selectedKeyword }?.suggestions ?? []
//                                if !suggestions.isEmpty {
//                                   
//                                    ForEach(suggestions, id: \.self) { suggestion in
//                                        Text(suggestion)
//                                            .whitetext15()
//                                            .fontWeight(.medium)
//                                            .fontDesign(.rounded)
//                                            .padding(.horizontal, 16)
//                                            .padding(.vertical, 4)
//                                            .background(Color.pinkClr.opacity(0.3))
//                                            .cornerRadius(10)
//                                            
//                                            
//                                            
//                                    }
//                                    .padding()
//                                }
//                            }
//                

            
            
            
            Spacer()
        }
        .onAppear{
            audioHelper.startRecording()
        }
        .onReceive(analyzeTimer) { _ in
            if audioHelper.isRecording {
                nlpHelper.findAdjAndVerb(in: audioHelper.recognizedText)
//                nlpHelper.findNegativeSentences(in: audioHelper.recognizedText)
                    }
                }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)

        .navigationBarBackButtonHidden(true)
    }
}

struct RecordRunningView_Previews: PreviewProvider {
    static var previews: some View {
        RecordRunningView()
    }
}
