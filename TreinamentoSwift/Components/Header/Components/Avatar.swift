//
//  Avatar.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 11/09/23.
//

import SwiftUI

struct Avatar: View {
    
    let name: String
    
    var body: some View {
        Circle()
            .foregroundColor(.black)
            .frame(width: 40, height: 40)
            .overlay(
                Text(name.first?.description ?? "")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            )
    }
    
    struct Avatar_Previews: PreviewProvider {
        static var previews: some View {
            Avatar(name: "Noah")
        }
    }
}
