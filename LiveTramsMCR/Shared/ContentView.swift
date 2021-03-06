//
//  ContentView.swift
//  Shared
//
//  Created by David Cook on 22/04/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var stops: [Stop] = []
    @State private var searchText = ""
    
    @StateObject private var favouritesStore = FavouriteStopStore()
    var body: some View {
        NavigationView {
            
            List {
                
                Section(header: Text("Favourites")){
                    ForEach(favouritesStore.stops.sorted {$0.stopName < $1.stopName}) { stop in
                        StopCell(stop: stop).environmentObject(favouritesStore)
                    }
                }
                
                Section(header: Text("All Stops")){
                    ForEach(searchResults.sorted { $0.stopName < $1.stopName }) { stop in
                        StopCell(stop: stop).environmentObject(favouritesStore)
                    }
                    
                    if (searchResults.count == 0){
                        HStack{
                            Spacer()
                            Text("Service infomration is currently unavailable")
                            Spacer()
                        }
                    }
                    
                    HStack{
                        Spacer()
                        Text("\(searchResults.count) Stops Found")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("Contains Transport for Greater Manchester data")
                            .foregroundColor(.secondary)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Stops")
            .onAppear() {
                
                FavouriteStopStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let stops):
                        favouritesStore.stops = stops
                    }
                    
                }
                
                StopRequest().requestStops { (stops) in
                    self.stops = stops
                }
                
                
            }
        }
    }
    
    var searchResults: [Stop] {
        if searchText.isEmpty {
            return stops
        } else {
            return stops.filter { $0.stopName.contains(searchText)}
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(stops: testData)
    }
}



