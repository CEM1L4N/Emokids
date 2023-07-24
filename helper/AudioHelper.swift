//
//  AudioHelper.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 19/07/23.
//

import Foundation
import SwiftUI
import Speech
import AVFoundation

class AudioHelper: ObservableObject{
    let audioEngine = AVAudioEngine()
    @StateObject private var nlpHelper = NLPHelper()

    @Published var isRecording = false
    @Published var recognizedText = ""
//    @Published var translateRecognizedText = ""

    func startRecording() {
        guard SFSpeechRecognizer.authorizationStatus() == .authorized else {
            print("Speech recognition not authorized")
            return
        }
        
        let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
        let request = SFSpeechAudioBufferRecognitionRequest()
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            
            let inputNode = audioEngine.inputNode
            let recordingFormat = inputNode.outputFormat(forBus: 0)
            
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
                request.append(buffer)
            }
            
            audioEngine.prepare()
            try audioEngine.start()
            
            isRecording = true
            
            
            recognizer?.recognitionTask(with: request, resultHandler: { [self] (result, error) in
                if let result = result {
                    self.recognizedText = result.bestTranscription.formattedString
                    print(recognizedText)
                } else if let error = error {
                    print("Recognition error: \(error)")
                }
            })
            
        } catch {
            print("Recording setup error: \(error.localizedDescription)")
        }
    }
    
    func stopRecording() {
        nlpHelper.foundNouns = []
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        isRecording = false
        
    }
    

}
