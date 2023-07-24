//
//  ContentView.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 23/06/23.
//


import SwiftUI



struct ContentView: View {
    
    @State var selectedKeyword: KeywordSuggestion?
    @State var selectedSuggestion: String = ""

    var body: some View {
        VStack {
            Text("Keyword Suggestions in SwiftUI")
                .font(.headline)

            TextField("Masukkan keyword", text: $selectedSuggestion)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: selectedSuggestion) { newValue in
                    selectedKeyword = keywordSuggestions.first { suggestion in
                        suggestion.keyword.lowercased() == newValue.lowercased()
                    }
                }

            if let selectedKeyword = selectedKeyword {
                List(selectedKeyword.suggestions, id: \.self) { suggestion in
                    Text(suggestion)
                        .padding()
                        .onTapGesture {
                            // Implement logic for handling the selected suggestion here
                            // For example, you can use the suggestion for further actions
                        }
                }
            } else {
                Text("No suggestions available")
                    .foregroundColor(.gray)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
