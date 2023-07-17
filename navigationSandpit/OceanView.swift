//
//  OceanView.swift
//  navigationSandpit
//
//  Created by Fred on 29.05.23.
//

import SwiftUI

struct OceanView: View {
    

    var ocean: Ocean
    @ObservedObject var oceanListModel: OceanListModel

    
    var body: some View {
        VStack {
            Text("\(ocean.name)")
        }
        .onAppear() {
            oceanListModel.select(ocean)
        }
    }
}


