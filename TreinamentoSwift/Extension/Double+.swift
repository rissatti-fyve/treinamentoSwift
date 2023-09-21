//
//  Double+.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
