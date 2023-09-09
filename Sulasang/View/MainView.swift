//
//  ContentView.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import SwiftUI

struct MainView: View {
    
    var observable = MainObservable()
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text("09월 08일 (금)")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.mainColor)
                    .padding(.top)
                    .padding(.bottom, 16)
                Text("11:30 ~ 14:00")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 16)
                menuList
                    .background(Color(uiColor: .systemGray6))
            }
        }
    }
    
    var menuList: some View {
        List {
            VStack(spacing: 0) {
                ForEach(observable.cafeteria) { cafeteria in
                    MenuCell(cafeteria: cafeteria)
                }
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparatorTint(Color(uiColor: .systemGray6))
        }
        .listStyle(.plain)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension Color {
    
    static let mainColor = Color(red: 19 / 255, green: 46 / 255, blue: 106 / 255)
    static let secondColor = Color(red: 234 / 255, green: 181 / 255, blue: 70 / 255)
    
}

