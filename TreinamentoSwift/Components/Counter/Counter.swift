//
//  Counter.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import SwiftUI

struct Counter: View {
    @Binding var value: Int
    var isSmall: Bool

    var body: some View {
        HStack(spacing: 16) {
            Button {
                if value > 0 {
                    value -= 1
                }
            } label: {
                Text(.init(systemName: "minus"))
                    .foregroundColor(.black)
                    .font(isSmall ? .system(size: 14) : .headline)
            }
            Text("\(value)")
                .font(isSmall ? .system(size: 14) : .headline)
            Button {
                value += 1
            } label: {
                Text(.init(systemName: "plus"))
                    .foregroundColor(.black)
                    .font(isSmall ? .system(size: 14) : .headline)
            }
        }
        .padding(isSmall ? 6 : 16)
        .padding(.horizontal, isSmall ? 4 : 0)
        .background(RoundedRectangle(cornerRadius: 6).stroke(Color("Border"), lineWidth: 1))
        .frame(width: (UIScreen.main.bounds.width * 2/5 ) - 32)
    }
}


//struct Counter_Previews: PreviewProvider {
//    static var previews: some View {
//        Counter(value: "")
//    }
//}
