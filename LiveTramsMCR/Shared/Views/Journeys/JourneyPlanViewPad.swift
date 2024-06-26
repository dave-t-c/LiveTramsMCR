//
//  JourneyPlanViewPad.swift
//  LiveTramsMCR (iOS)
//
//  Created by David Cook on 07/05/2023.
//

import Foundation
import SwiftUI
import OrderedCollections
import MapKit

struct JourneyPlanViewPad: View {
    
    var initialOrigin: String =  ""
    var stops: [Stop] = []

    @State private var originStop: String = ""
    
    @State private var destinationStop: String = ""
    @State private var processedPlannedJourneyV2: ProcessedPlannedJourneyV2?
    @State private var journeyPlannerV2Request = JourneyPlannerV2Request()
    @State private var servicesRequest = ServicesRequest()
    @State private var gettingJourneyRequest: Bool = false
    @State private var journeyMapAvailable: Bool = false
    
    @State private var plannedJourneyV2: PlannedJourneyV2Response? = nil
    
    
    var availableDestinationStops: [String] {
        let stopsCopy = stops
        return stopsCopy.filter { $0.stopName != originStop }.map {$0.stopName}
    }
    
    var availableOriginStops: [String] {
        let stopsCopy = stops
        return stopsCopy.filter { $0.stopName != destinationStop }.map {$0.stopName}
    }
    
    
    var body: some View {
        List {
            Section{
                
                VStack{
                    Picker("Origin", selection: $originStop){
                        Text("Select Stop").tag("")
                        ForEach(availableOriginStops, id: \.self) { stop in
                            Text(stop).tag(stop)
                        }
                    }
                    .onAppear {
                        originStop = originStop == "" ? initialOrigin : originStop
                    }
                    
                    
                    HStack{
                        Image(systemName: "arrow.triangle.swap")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                let temp = destinationStop
                                destinationStop = originStop
                                originStop = temp
                            }
                        Spacer()
                    }
                    Picker("Destination", selection: $destinationStop){
                        Text("Select Stop").tag("")
                        ForEach(availableDestinationStops, id: \.self) { stop in
                            Text(stop).tag(stop)
                        }
                    }
                }
                
            }
            Section{
                HStack{
                    Spacer()
                    Button(action: {
                        Task {
                            gettingJourneyRequest = true
                            let originStopDetail = stops.first{ $0.stopName == originStop }
                            let destinationStopDetail = stops.first{ $0.stopName == destinationStop }
                            if (originStopDetail == nil || destinationStopDetail == nil){
                                return
                            }
                            plannedJourneyV2 = try await journeyPlannerV2Request.planJourney(originName: originStopDetail!.tlaref, destinationName: destinationStopDetail!.tlaref)
                            gettingJourneyRequest = false
                            if(plannedJourneyV2 == nil){
                                return
                            }
                            
                            processedPlannedJourneyV2 = ProcessedPlannedJourneyV2(plannedJourney: plannedJourneyV2!)
                        }
                    }) {
                        Label("Plan Journey", systemImage: "tram.fill")
                    }
                    .padding()
                    
                    if (gettingJourneyRequest) {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    
                    Spacer()
                }
            }
            
            if(processedPlannedJourneyV2 != nil && plannedJourneyV2 != nil)
            {
                Section {
                    
                    Text(processedPlannedJourneyV2!.formattedTime).font(.headline)
                    
                    if (plannedJourneyV2!.plannedJourney.requiresInterchange){
                        InterchangeJourneyView(plannedJourney: plannedJourneyV2!.plannedJourney, processedPlannedJourney: processedPlannedJourneyV2!)
                    }
                    else{
                        NonInterchangeJourneyView(plannedJourney: plannedJourneyV2!.plannedJourney, processedPlannedJourney: processedPlannedJourneyV2)
                    }
                    
                    ServiceInformationView(serviceInformation: plannedJourneyV2!.serviceUpdates)
                }
                
                
                
            }
            
        }
        
        .navigationTitle("Journey Planner")
    }
}
