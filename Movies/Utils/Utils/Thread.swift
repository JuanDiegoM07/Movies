//
//  Thread.swift
//  Movies
//
//  Created by Juan Diego Marin on 4/11/22.
//

import Foundation

enum Thread {
    static func main(_ block: @escaping () -> Void?) {
        DispatchQueue.main.async {
            block()
        }
    }
}
