//
//  TFErrors.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/30/21.
//

import Foundation


enum TFErrors: String, Error {
    
    case invalidUrl         = "The link is broken"
    case invalidResponse    = "Bad response from server, please try again"
    case invalidData        = "no data available on server, please check again"
    
}
