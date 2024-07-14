//
//  ContentView.swift
//  WordScramble
//
//  Created by Rushikesh Dadas on 29/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    HStack {
                        Text("score : ")
                        Text(String(score))
                    }
                    .font(.title)
                    .fontWeight(.semibold)
                }
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showAlert){
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        }
        
        Button("Start New Game", action: startGame)
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word already exist", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word is not possible", message: "You cant spell that from the rootword")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "The word is not real", message: "Try something realistic")
            return
        }
        
        withAnimation(){
            usedWords.insert(answer, at: 0)
            score += answer.count
        }
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL){
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from the bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
                print(tempWord)
            }else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word : String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showAlert = true
    }
    
}

#Preview {
    ContentView()
}
