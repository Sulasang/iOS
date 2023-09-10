//
//  MenuBoardResponse.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import Foundation

struct MenuBoardResponseDTO: Codable {
    let status: Int
    let result: ResultDTO
}

struct ResultDTO: Codable {
    let dateAndTypeDietInfo: [DateAndTypeDietInfoDTO]
}

struct DateAndTypeDietInfoDTO: Codable {
    let company: String
    let commonMenu: [String]
    let mainMenu: [String]
    let mealType: String
    let restaurantType: String
}
