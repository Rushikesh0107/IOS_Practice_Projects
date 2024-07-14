//
//  AddBookView.swift
//  BookwormApp
//
//  Created by Rushikesh Dadas on 02/07/24.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating  = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    
                    Picker("Select genre", selection: $genre){
                        ForEach(genres, id: \.self){
                                Text($0)
                        }
                    }
                }
                
                Section("Write a review"){
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Button("Save"){
                    guard !title.isEmpty, !author.isEmpty else {
                        print("Title or author is empty")
                        return
                    }
                    
                    let newBook = Book(title: title, author: author, genre: genre, rating: rating, review: review)
                    modelContext.insert(newBook)
                    dismiss()
                    
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
