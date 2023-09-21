//
//  IconTitled.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 12/09/23.
//

import SwiftUI

struct IconTitled: View {
    let iconString: String
    let title: String
    
    var body: some View {
        VStack{
            Text(.init(systemName: iconString))
                .font(.system(size: 16))
                .fontWeight(.light)
            Text(title)
                .font(.system(size: 10))
        }
    }
}

struct IconTitled_Previews: PreviewProvider {
    static var previews: some View {
        IconTitled(iconString: "square.grid.2x2", title: "Listagem")
    }
}
