//
//  ModelCollectioView.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/30/21.

//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct GetTarif: Codable {

    let list: [List]
}

// MARK: - List
struct List: Codable {

    let name: String
    let main: MainClass
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp: Double

}








