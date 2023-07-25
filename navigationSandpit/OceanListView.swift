//
//  OceanListView.swift
//

import SwiftUI


struct OceanListView: View {

    @ObservedObject var oceanListModel: OceanListModel
    
    @State private var toggleState = false
        
    var body: some View {
        VStack {
            List(selection: $oceanListModel.multiSelection) {
                Section(header:
                    Toggle("Toggle me", isOn: $toggleState)
                ){
                    ForEach(oceanListModel.oceans, id: \.self) { ocean in
                        NavigationLink("\(ocean.name)") {
                            Text("\(ocean.name)")
                        }
                    }
                }
            }
        }
        .navigationTitle("\(oceanListModel.multiSelection.count) selected")
        .navigationBarTitleDisplayMode(.inline)
    }
}


