//
//  NLPHelper.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 18/07/23.
//

import Foundation
import NaturalLanguage

class NLPHelper: ObservableObject {
    static let instance = NLPHelper()
    @Published var foundNouns = [String]()
    @Published var foundSentences = [String]()
    
    
    func findAdjAndVerb(in paragraph: String) -> [String] {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = paragraph
        
        
        tagger.enumerateTags(in: paragraph.startIndex..<paragraph.endIndex, unit: .word, scheme: .lexicalClass, options: .omitPunctuation) { tag, tokenRange in
            if let tag = tag, tag == .adjective || tag == .verb {
                let noun = String(paragraph[tokenRange])
                if !foundNouns.contains(noun){
                    foundNouns.append(noun)
                }
            }
            return true
        }
        print(foundNouns)
        return foundNouns
    }
    

     func generateSummary(for strings: [String]) -> String {
            var allText = ""
            for string in strings {
                allText += string + " "
            }

            let tagger = NLTagger(tagSchemes: [.lexicalClass])
            tagger.string = allText

            var keywordsFrequency = [String: Int]()
            let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation]
            tagger.enumerateTags(in: allText.startIndex..<allText.endIndex, unit: .sentence, scheme: .lexicalClass, options: options) { tag, tokenRange in
                if let tag = tag, tag == .noun || tag == .verb {
                    let keyword = String(allText[tokenRange])
                    keywordsFrequency[keyword, default: 0] += 1
                }
                return true
            }

            // Sort keywords by frequency in descending order
            let sortedKeywords = keywordsFrequency.sorted { $0.value > $1.value }

            // Select the top N keywords to form the summary
            let numberOfKeywords = 5
            let topKeywords = Array(sortedKeywords.prefix(numberOfKeywords)).map { $0.key }

            // Combine the top keywords to create the summary
            let summary = topKeywords.joined(separator: " ")

            return summary
        }
    
     func generateSummaryUsingTagger(from paragraphs: [String]) -> String {
            var summaries = ""

            let tagger = NLTagger(tagSchemes: [.lexicalClass])
            let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]

            for paragraph in paragraphs {
                tagger.string = paragraph

                var sentences = [String]()
                tagger.enumerateTags(in: paragraph.startIndex..<paragraph.endIndex, unit: .sentence, scheme: .lexicalClass, options: options) { tag, tokenRange in
                    let sentence = String(paragraph[tokenRange])
                    sentences.append(sentence)
                    return true
                }

                let numberOfSentences = min(sentences.count, 2) // Choose the first 2 sentences as summary
                summaries += sentences.prefix(numberOfSentences).joined(separator: " ") + "\n"
            }

            return summaries
        }
    
     func generateSummaryUsingTokenizer(from paragraphs: [String]) -> String {
            var summaries = ""

            let tokenizer = NLTokenizer(unit: .sentence)

            for paragraph in paragraphs {
                tokenizer.string = paragraph

                var sentences = [String]()
                tokenizer.enumerateTokens(in: paragraph.startIndex..<paragraph.endIndex) { tokenRange, _ in
                    let sentence = String(paragraph[tokenRange])
                    sentences.append(sentence)
                    return true
                }

                let numberOfSentences = min(sentences.count, 2) // Choose the first 2 sentences as summary
                summaries += sentences.prefix(numberOfSentences).joined(separator: " ") + "\n"
            }

            return summaries
        }
    
    func findNegativeSentences(in text: String) -> [String] {
            
            let tagger = NLTagger(tagSchemes: [.sentimentScore])
            tagger.string = text

            let sentenceRange = text.startIndex..<text.endIndex
            tagger.enumerateTags(in: sentenceRange, unit: .sentence, scheme: .sentimentScore) { (tag, sentenceRange) -> Bool in
                if let tag = tag, let sentimentScore = Double(tag.rawValue), sentimentScore < 0 {
                    let sentence = String(text[sentenceRange])
                    
                    if !foundSentences.contains(sentence){
                        foundSentences.append(sentence)
                    }
//                    foundSentences.append(sentence)
                }
                return true
            }

            return foundSentences
        }
    
//    func analyzeSentiment() {
//            let tagger = NLTagger(tagSchemes: [.sentimentScore])
//            tagger.string = inputSentence
//
//            let (sentimentScore, _, _) = tagger.tag(at: inputSentence.startIndex, unit: .paragraph, scheme: .sentimentScore)
//
//            if let score = sentimentScore?.rawValue, let scoreValue = Double(score) {
//                if scoreValue > 0 {
//                    sentiment = .positive
//                } else if scoreValue < 0 {
//                    sentiment = .negative
//                } else {
//                    sentiment = .neutral
//                }
//            } else {
//                sentiment = .neutral
//            }
//        }
}
