//
//  Sugestion.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 22/07/23.
//

import Foundation

struct KeywordSuggestion: Hashable {
    let keyword: String
    let suggestions: [String]
}

var keywordSuggestions: [KeywordSuggestion] = [
    KeywordSuggestion(keyword: "hit", suggestions: ["Apakah kamu memukulnya?, kamu bisa meminta maaf kepadanya dan peluk dia"]),
    KeywordSuggestion(keyword: "crying", suggestions: ["Sepertinya anakmu bersedih, kamu bisa menawarkan bantuan untuk mengungkapkan perasaannya",
                                                       "Kamu dapat memberikannya pelukan agar dia lebih tenang"]),
    
]
