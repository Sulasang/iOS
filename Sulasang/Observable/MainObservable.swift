//
//  MainObservable.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import Foundation

final class MainObservable: ObservableObject {
    @Published var cafeteria: [Cafeteria] = [
        Cafeteria(id: UUID(), type: .chefTable, menu: ["(셀프)치킨샐러드"]),
        Cafeteria(id: UUID(), type: .littleKitchen, menu: ["밥", "김", "김치", "소세지"]),
        Cafeteria(id: UUID(), type: .MomsCook, menu: ["밥", "김", "김치", "소세지"]),
        Cafeteria(id: UUID(), type: .staff, menu: ["밥", "김", "김치", "소세지", "밥", "김", "김치", "소세지"])
    ]
}
