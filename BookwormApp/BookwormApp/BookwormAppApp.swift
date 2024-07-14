//
//  BookwormAppApp.swift
//  BookwormApp
//
//  Created by Rushikesh Dadas on 02/07/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
