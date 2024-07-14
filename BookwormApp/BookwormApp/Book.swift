//
//  Book.swift
//  BookwormApp
//
//  Created by Rushikesh Dadas on 02/07/24.
//

import Foundation
import SwiftData

@Model
class Book {
    let title : String
    let author : String
    let genre : String
    let rating : Int
    let review  : String
    
    
    init(title: String, author: String, genre: String, rating: Int, review: String) {
        self.title = title
        self.author = author
        self.genre = genre
        self.rating = rating
        self.review = review
    }
}

