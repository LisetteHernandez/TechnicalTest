//
//  MapsPinView.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import SwiftUI

struct MapsPinView: View {
    // Generate 10 random locations
    let randomLocations = RandomLocation.generateRandomLocations(count: 50)

    var body: some View {
        VStack(spacing: 10) {
            
            Text("Exercise 4: MapKit Integration")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            // Instruction text for the exercise.
            Text("Task: Create an iOS app that integrates MapKit and displays a map with annotations for a list of locations. The app should fetch the location data from an API endpoint and display pins on the map for each location.")
                .font(.caption)
                .fontWeight(.bold)
                .padding()
            
            MapView(locations: randomLocations)
                .ignoresSafeArea()
        }
        
    }
}
