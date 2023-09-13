//
//  ContentView.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var observable = MainObservable()
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .gray
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            TabView {
                if observable.todayMenuBoard == nil {
                    ProgressView()
                } else {
                    todayPage
                }
                if observable.nextDayMenuBoard == nil {
                    ProgressView()
                } else {
                    nextDayPage
                }
            }
            .ignoresSafeArea()
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }
    
    @ViewBuilder
    var todayPage: some View {
        if observable.todayMenuBoard == [] {
            ZStack {
                VStack(spacing: 0) {
                    Text(observable.today)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.mainColor)
                        .padding(.top)
                        .padding(.bottom, 16)
                    Spacer()
                }
                emptyMenu
            }
        } else {
            VStack(spacing: 0) {
                Text(observable.today)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.mainColor)
                    .padding(.top)
                    .padding(.bottom, 16)
                Text("11:30 ~ 14:00")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 16)
                menuList(menuBoard: observable.todayMenuBoard!)
                    .background(Color(uiColor: .systemGray6))
            }
        }
        
    }
    
    @ViewBuilder
    var nextDayPage: some View {
        if observable.nextDayMenuBoard == [] {
            ZStack {
                VStack(spacing: 0) {
                    Text(observable.nextDay)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.mainColor)
                        .padding(.top)
                        .padding(.bottom, 16)
                    Spacer()
                }
                emptyMenu
            }
        } else {
            VStack(spacing: 0) {
                Text(observable.nextDay)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.mainColor)
                    .padding(.top)
                    .padding(.bottom, 16)
                Text("11:30 ~ 14:00")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 16)
                menuList(menuBoard: observable.nextDayMenuBoard!)
                    .background(Color(uiColor: .systemGray6))
            }
        }
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
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.white)
            .frame(height: 434)
            .padding(.horizontal, 20)
            .shadow(radius: 3)
            .overlay {
                VStack(spacing: 0) {
                    Text("주말 휴업 안내")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.mainColor)
                        .padding(.bottom, 60)
                    Text("안녕하세요. 수라상입니다.\n 주말에는 수라상이 운영되지 않습니다.\n참고 부탁드립니다.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(.mainColor)
                        .lineSpacing(12)
                        .padding(.bottom, 112)
                    Text("운영시간 : 평일")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(.mainColor)
                        .padding(.bottom, 12)
                    Text("문의 : sozohoy@gmail.com")
                        .foregroundColor(.mainColor)
                        .tint(.accentColor)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
