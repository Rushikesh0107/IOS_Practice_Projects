//
//  ContentView.swift
//  BookwormApp
//
//  Created by Rushikesh Dadas on 02/07/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(books){book in
                    NavigationLink(value: book){
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBook)
            }
                .navigationTitle("Bookworm")
                .navigationDestination(for: Book.self) { book in
                    BookDetailsView(book: book)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button("Add book",systemImage: "plus"){
                            showSheet = true
                        }
                    })
                    
                    ToolbarItem(placement: .topBarLeading, content: {
                        EditButton()
                    })
                }
                .sheet(isPresented: $showSheet, content: {
                    AddBookView()
                })
        }
    }
    
    func deleteBook(at offsets: IndexSet){
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
