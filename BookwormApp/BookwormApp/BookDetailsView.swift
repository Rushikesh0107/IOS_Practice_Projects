//
//  BookDetailsView.swift
//  BookwormApp
//
//  Created by Rushikesh Dadas on 02/07/24.
//

import SwiftData
import SwiftUI

struct BookDetailsView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var showAlert = false
    
    var book : Book
    
    var body: some View {
        ScrollView{
            ZStack{
                Image(book.genre)

                Text(book.genre.uppercased())
                    .font(.title3.bold())
                    .padding(8)
                    .background(.white.opacity(0.5))
                    .clipShape(.capsule)
                    .offset(x: 140, y: 75)
                    .foregroundColor(.black)
            }
            
            VStack(alignment: .center){
                Text(book.author)
                    .font(.title)
                
                Text(book.review)
                    .font(.title2)
                
                RatingView(rating: .constant(book.rating))
                    .padding()
            }
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Button("Delete", systemImage: "trash"){
                    showAlert = true
                }
            }
        }
        .alert("Delete this book", isPresented: $showAlert){
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive, action: deleteBook)
        } message: {
            Text("Are you sure ?")
        }
    }
    
    func deleteBook(){
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", rating: 3, review: "The best book ever!!")
        
        return BookDetailsView(book: example)
            .modelContainer(container)
    }catch {
        return Text("Failed to create a preview - \(error.localizedDescription)")
    }
    
}
