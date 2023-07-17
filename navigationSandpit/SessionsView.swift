//
//  SessionsView.swift
//  movesmart golf
//
//  Created by Fred on 23.05.23.
//

import SwiftUI

struct SessionsView: View {
    
    
    struct Ocean: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }

    private var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]

    @State private var multiSelection = Set<Ocean>()
    @State private var singleSelection: Ocean?

    var body: some View {
        List(oceans, id: \.self, selection: $singleSelection) { ocean in
            NavigationLink {
                Text(ocean.name)
            } label: {
                Text(ocean.name)
            }
            
        }
        .navigationTitle("Oceans")
        .toolbar { EditButton() }

//        Text("\(multiSelection.count) selections")
        Text("\(singleSelection?.name ?? "none")")
    }
}

