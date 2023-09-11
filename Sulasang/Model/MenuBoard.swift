//
//  Menu.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import Foundation

struct MenuBoard: Identifiable, Equatable {
    let id: UUID
    let type: CompanyType
    let menu: [String]
}

enum CompanyType: String {
    case chefTable = "Chef Table"
    case littleKitchen = "Little Kitchen"
    case momsCook = "Mom's Cook"
    case staff = "교직원"
}
