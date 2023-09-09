//
//  Menu.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import Foundation

struct Cafeteria: Identifiable {
    let id: UUID
    let type: CafeteriaType
    let menu: [String]
}

enum CafeteriaType: String {
    case chefTable = "Chef Table"
    case littleKitchen = "Little Kitchen"
    case momsCook = "Mom's Cook"
    case staff = "교직원"
}
