//
//  ErrorMessages.swift
//  GHFollowers
//
//  Created by Rushikesh Dadas on 10/06/24.
//

import Foundation

enum GFError :String, Error {
    case invalidUsername = "Username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalideResponse = "Invalid response from the server. Please try again"
    case invalidData = "Data recevied from the server is Invalid. Please try again"
}
