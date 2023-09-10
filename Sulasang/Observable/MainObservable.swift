//
//  MainObservable.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import Foundation

final class MainObservable: ObservableObject {
    
    let menuBoardManager = MenuBoardManager()
    @Published var cafeteria: [Cafeteria] = []
    var today = ""
    
    init() {
        self.fetchData()
        self.today = self.getCurrentFormattedDateString()
    }
    
    func fetchData() {
        menuBoardManager.fetchData { result in
            switch result {
            case .success(let result):
                let fetchMenu = result.map {
                    Cafeteria(id: UUID(), type: CafeteriaType(rawValue: $0.company) ?? .staff, menu: $0.mainMenu)
                }
                DispatchQueue.main.async {
                    self.cafeteria = fetchMenu
                }
            case .failure(let error):
                print("@Log Observable - \(error.localizedDescription)")
            }
        }
    }
    
    func getCurrentFormattedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일 (E)"
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
    
}
