//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var oceanListModel = OceanListModel()

    var body: some View {
        NavigationView {
            NavigationLink("Oceans") {
                VStack {
                    OceanListView(oceanListModel: oceanListModel)
                }
                .toolbar {
                    EditButton()
                }
            }
        }
    }

}
