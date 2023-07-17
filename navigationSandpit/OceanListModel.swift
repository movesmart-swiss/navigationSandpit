//
//  OceanListModel.swift
//  navigationSandpit
//
//  Created by Fred on 01.07.23.
//

import Foundation

struct Ocean: Identifiable, Hashable {
    let name: String
    let id = UUID()
}



class OceanListModel: ObservableObject {
    @Published var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]
    
    @Published var multiSelection = Set<Ocean>()
    @Published var singleSelection: Ocean?
    
    func select(_ ocean: Ocean) {
        singleSelection = ocean
        multiSelection = [ocean]
    }

}
