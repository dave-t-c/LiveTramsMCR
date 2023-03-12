//
//  JourneyPlannerRequest.swift
//  LiveTramsMCR
//
//  Created by David Cook on 14/10/2022.
//

import Foundation

class JourneyPlannerRequest: ObservableObject {
    @Published var plannedJourney: PlannedJourney?
    
    func planJourney(originName: String, destinationName: String) async throws -> PlannedJourney? {
        let escapedOriginName = originName.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        let escapedDestinationName = destinationName.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        guard let url = URL(string: "https://api.livetramsmcr.com/v1/journey-planner/\(escapedOriginName!)/\(escapedDestinationName!)") else {
            print("Invalid url...")
            return plannedJourney
        }
        var data: Data
        var response: URLResponse
        var plannedJourney: PlannedJourney?
        do {
            (data, response) = try await URLSession.shared.data(from: url)
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200{
                    return plannedJourney
                }
            }
            plannedJourney = try JSONDecoder().decode(PlannedJourney.self, from: data)
            
            return plannedJourney
        }
        catch {
            return plannedJourney
        }
    }
}