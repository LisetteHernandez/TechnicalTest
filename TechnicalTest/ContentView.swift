//
//  ContentView.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import SwiftUI

// ContentView presents the main user interface.
struct ContentView: View {

    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all) // Full-screen background color.
                
                VStack {
                    Text("Technical Test")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding() 
                    
                    Spacer() // Centers the button vertically.
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: SumArrayView()) {
                            Text("Exercise 1: Swift Basics")
                                .modifier(ButtonModifier()) // Styled button.
                        }
                        
                        NavigationLink(destination: ProductListView()) {
                            Text("Exercise 2: Table View Integration")
                                .modifier(ButtonModifier()) // Styled button.
                        }
                        
                        NavigationLink(destination: MapsPinView()) {
                            Text("Exercise 4: MapKit Integration")
                                .modifier(ButtonModifier()) // Styled button.
                        }
                        
                    }
                    
                    Spacer()
                }
                .padding(50) // Padding for the content container.
                
            }
        }
    }
}

// ButtonModifier standardizes button appearance.
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity) // Button width.
            .padding()
            .background(Color.white) // Button background.
            .foregroundColor(.black) // Text color.
            .cornerRadius(10) // Rounded corners.
            .shadow(radius: 2) // Shadow effect.
    }
}
