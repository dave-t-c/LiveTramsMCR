//
//  StopDetail.swift
//  TfGM-API-Wrapper-iOS
//
//  Created by David Cook on 23/04/2022.
//

import SwiftUI
import MapKit

struct StopDetail: View {
    
    var stop: Stop
    @State private var mapManager = MapManager()
    
    @EnvironmentObject var favouritesStore: FavouriteStopStore
    
    var body: some View {
        List {
            Section {
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: stop.latitude, longitude: stop.longitude), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))))
                    .aspectRatio(contentMode: .fit)
            }
            
            Section{
                NavigationLink (destination: ServicesView(stop: stop)) {
                    Label("View Live Departures", systemImage: "tram")
                        .padding()
                }
            }
            Button {
                mapManager.openMapsFromStop(stop: stop)
            } label: {
                Label("Open in Maps", systemImage: "map.fill")
            }
            .padding()
            
            NavigationLink (destination: NearPublicTransport(stop: stop)) {
                Label("Nearby", systemImage: "mappin.and.ellipse")
                    .padding()
            }
            
            Label(stop.street, systemImage: "car")
                .padding()
            Label("Stop Zone: \(stop.stopZone)", systemImage: "tram")
                .padding()
            
            Section{
                if favouritesStore.stops.contains(self.stop) {
                    Button(action: {
                        // Remove stop from favourites
                        
                        favouritesStore.stops.removeAll {$0 == self.stop}
                        FavouriteStopStore.save(favouriteStops: favouritesStore.stops) { result in
                            if case .failure(let error) = result {
                                fatalError(error.localizedDescription)
                            }
                        }
                        
                        
                    }) {
                        Label("Remove from favourites", systemImage: "star.slash")
                            .foregroundColor(.red)
                    }
                    .padding()
                    
                } else {
                    Button(action: {
                        // Adds the stop to favourites
                        favouritesStore.stops.append(self.stop)
                        FavouriteStopStore.save(favouriteStops: favouritesStore.stops) { result in
                            if case .failure(let error) = result {
                                fatalError(error.localizedDescription)
                            }
                        }
                    }) {
                        Label("Add to favourites", systemImage: "star.fill")
                    }
                    .padding()
                }
            }
        }
        .navigationTitle(stop.stopName)
        .edgesIgnoringSafeArea(.bottom)
        .padding(.all)
    }
}

struct StopDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
                StopDetail(stop: testData[2])
            }
            NavigationView{
                StopDetail(stop: testData[3])
            }
        }
        
    }
}
