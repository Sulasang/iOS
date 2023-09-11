//
//  MainObservable.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import Foundation

final class MainObservable: ObservableObject {
    
    let menuBoardManager = MenuBoardManager()
    @Published var todayMenuBoard: [MenuBoard] = []
    @Published var nextDayMenuBoard: [MenuBoard] = []
    var today = ""
    var nextDay = ""
    
    init() {
        self.fetchMenuBoard(day: .today)
        self.fetchMenuBoard(day: .nextDay)
        self.today = self.formattedDate(date: Date(), dateFormatterType: .dateToPrint)
        self.nextDay = self.formattedDate(date: getNextDay(), dateFormatterType: .dateToPrint)
    }
    
    func fetchMenuBoard(day: DayToGetMenu) {
        let date = dateToString(day: day)
        
        menuBoardManager.fetchData(date: date) { [weak self] result in
            switch result {
            case .success(let result):
                let fetchMenuBoard = result.map {
                    MenuBoard(id: UUID(), type: CompanyType(rawValue: $0.company) ?? .staff, menu: $0.mainMenu)
                }
                DispatchQueue.main.async {
                    switch day {
                    case .today:
                        self?.todayMenuBoard = fetchMenuBoard
                    case .nextDay:
                        self?.nextDayMenuBoard = fetchMenuBoard
                    }
                    
                }
            case .failure(let error):
                print("@Log Observable - \(error.localizedDescription)")
            }
        }
    }
    
    func dateToString(day: DayToGetMenu) -> String {
        switch day {
        case .today:
            return formattedDate(date: Date(), dateFormatterType: .dateToGet)
        case .nextDay:
            return formattedDate(date: getNextDay(), dateFormatterType: .dateToGet)
        }
    }
    
    func formattedDate(date: Date, dateFormatterType: DateFormatterType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormatterType.dateFormat
        if dateFormatterType == .dateToPrint {
            dateFormatter.locale = Locale(identifier: "ko_KR")
        }
        return dateFormatter.string(from: date)
    }
    
    func getNextDay() -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    }
    
}

enum DayToGetMenu {
    case today
    case nextDay
}

enum DateFormatterType {
    case dateToGet
    case dateToPrint
    
    var dateFormat: String {
        switch self {
        case .dateToGet:
            return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        case .dateToPrint:
            return "MM월 dd일 (E)"
        }
    }
}
