//
//  MenuCell.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import SwiftUI

struct MenuCell: View {
    
    var cafeteria: Cafeteria
    
    var body: some View {
        VStack(spacing: 0) {
            
            //MARK: 학식 Type
            Rectangle()
                .fill(Color.mainColor)
                .frame(height: 31)
                .overlay {
                    HStack(spacing: 0) {
                        Text(cafeteria.type.rawValue)
                            .foregroundColor(.secondColor)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.leading, 12)
                        Spacer()
                    }
                }
                .padding(.bottom, 8)
            
            //MARK: 학식 메뉴들
            ForEach(cafeteria.menu.indices, id: \.self) { index in
                HStack(spacing: 0) {
                    Text(cafeteria.menu[index])
                        .font(.system(size: 14, weight: .medium))
                        .padding(.leading, 12)
                        .padding(.bottom, 4)
                    Spacer()
                }
            }
            .padding(.bottom, 8)
        }
        .background(.white)
        .cornerRadius(12)
        .padding(.horizontal, 20)
        .padding(.bottom, 16)
        .background(Color(uiColor: .systemGray6))
    }
    
}

struct MenuCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuCell(cafeteria: Cafeteria(id: UUID(),
                                      type: .staff,
                                      menu: ["밥", "김", "김치", "소세지", "밥", "김", "김치", "소세지"]))
    }
}
