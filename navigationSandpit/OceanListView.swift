//
//  OceanListView.swift
//  navigationSandpit
//
//  Created by Fred on 28.05.23.
//

import SwiftUI


struct OceanListView: View {

//    @EnvironmentObject var oceanListModel: OceanListModel
    @StateObject private var oceanListModel = OceanListModel()
    
    @Binding var externalProperty: String
    
    @State private var isOn = false
    

    var body: some View {
//        NavigationView {
            VStack {
//                List(oceans, id: \.self, selection: $singleSelection) { ocean in
                List(selection: $oceanListModel.multiSelection) {
                    Section(header:
                        Toggle("Switch me", isOn: $isOn)
                    ){
                        ForEach(oceanListModel.oceans, id: \.self) { ocean in
                            NavigationLink(
                                destination: OceanView(ocean: ocean, oceanListModel: oceanListModel),
                                tag: ocean,
                                selection: $oceanListModel.singleSelection) {
                                    Text(ocean.name)
                                }
                                .listRowBackground(oceanListModel.multiSelection.contains(ocean) ? Color(UIColor.systemGray4) : Color(UIColor.systemBackground))
                            //                        .listRowBackground(oceanListModel.multiSelection.contains(ocean) ? Color.accentColor : Color(UIColor.systemBackground))
                            //                        .foregroundColor(oceanListModel.multiSelection.contains(ocean) ? Color(UIColor.systemBackground) : Color(UIColor.label))
                        }
                    }
                }
                Text("\(oceanListModel.multiSelection.count) selected")
//                Text("\(singleSelection?.name ?? "none") selected")
            }
            .onChange(of: oceanListModel.singleSelection) { newSingleSelection in
                NSLog("onChange of oceanListModel.singleSelection: \(String(describing: newSingleSelection))")
            }
            .onChange(of: oceanListModel.multiSelection) { newMultiSelection in
                NSLog("onChange of oceanListModel.multiSelection: \(newMultiSelection.map({ $0.name }))")
            }
            .onAppear() {
                NSLog("onAppear: \(oceanListModel.multiSelection.map({ $0.name }))")
            }
            .onDisappear() {
                NSLog("onDisappear: \(oceanListModel.multiSelection.map({ $0.name }))")
            }
            .navigationTitle("\(externalProperty) Oceans")
            .toolbar { EditButton() }
//        }
    }
}


