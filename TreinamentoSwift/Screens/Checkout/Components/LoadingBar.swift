//
//  LoadingBar.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import SwiftUI

struct LoadingBar: View {
    let quantitySteps: Int
    let actualStep: Int
    var body: some View {
        HStack(spacing: 0){
                    ForEach(1...quantitySteps, id: \.self) { step in
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / CGFloat(quantitySteps)), height: 4)
                            .foregroundColor(step <= actualStep ? Color.black : Color("Surface"))
                    }
                }
            }
}

struct LoadingBar_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBar(quantitySteps: 3, actualStep: 2)
    }
}
