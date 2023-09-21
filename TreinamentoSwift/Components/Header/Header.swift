//
//  Header.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 11/09/23.
//

import SwiftUI

struct Header: View {
    @Binding var productsSearched: [ProductBack]
    
    var body: some View {
        HStack{
            SearchBar(productsSearched: $productsSearched)
            Avatar(name: "Noah")
        }
        .padding(.horizontal,16)
        .padding(.bottom,8)
    }
}

//struct Header_Previews: PreviewProvider {
//    static var previews: some View {
//        Header()
//    }
//}
