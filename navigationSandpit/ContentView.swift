//
//  ContentView.swift
//  navigationSandpit
//
//  Created by Fred on 25.05.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var externalProperty: String = "Hello"
   
    var body: some View {
        NavigationView {
            NavigationLink("Oceans") {
                OceanListView(externalProperty: $externalProperty)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
