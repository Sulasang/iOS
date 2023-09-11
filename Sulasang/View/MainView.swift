//
//  ContentView.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var observable = MainObservable()
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            TabView {
                todayPage
                nextDayPage
            }
            .ignoresSafeArea()
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
        
    }
    
    @ViewBuilder
    var todayPage: some View {
        VStack(spacing: 0) {
            Text(observable.today)
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(.mainColor)
                .padding(.top)
                .padding(.bottom, 16)
            Text("11:30 ~ 14:00")
                .font(.system(size: 18, weight: .bold))
                .padding(.bottom, 16)
            menuList(menuBoard: observable.todayMenuBoard)
                .background(Color(uiColor: .systemGray6))
        }
    }
    
    @ViewBuilder
    var nextDayPage: some View {
        Text(observable.nextDay)
            .font(.system(size: 34, weight: .bold))
            .foregroundColor(.mainColor)
            .padding(.top)
            .padding(.bottom, 16)
        Text("11:30 ~ 14:00")
            .font(.system(size: 18, weight: .bold))
            .padding(.bottom, 16)
        menuList(menuBoard: observable.nextDayMenuBoard)
            .background(Color(uiColor: .systemGray6))
    }
    
    func menuList(menuBoard: [MenuBoard]) -> some View {
        return List {
            VStack(spacing: 0) {
                ForEach(menuBoard) { menuBoard in
                    MenuCell(menuBoard: menuBoard)
                }
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparatorTint(Color(uiColor: .systemGray6))
        }
        .listStyle(.plain)
    }
    
    var emptyMenu: some View {
        Rectangle()
            .padding(.horizontal, 20)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
