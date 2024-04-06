//
//  SumArrayView.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import SwiftUI

struct SumArrayView: View {
    
    // State variable to store the array of integers
    @State private var numbers: [Int] = []
    // State variable to store the message displaying the sum of even numbers
    @State private var evenSumMessage = ""
    
    var body: some View {
        
        ZStack {
            
            Color("BackgroundColor").edgesIgnoringSafeArea(.all) // Full-screen background color.
            
            VStack(spacing: 10) {
                
                Text("Exercise 1: Swift Basics")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Write a function in Swift that takes an array of integers as input and returns the sum of all even numbers in the array.")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding()
                
                // Button to generate an array of integers
                Button("Generate Integer Array") {
                    // Generates an array of 10 random integers ranging from 1 to 100
                    numbers = (1...10).map { _ in Int.random(in: 1...100) }
                    // Resets the message for the sum of even numbers
                    evenSumMessage = ""
                } 
                .modifier(ButtonModifier())
                
                // Displays the generated array if not empty
                if !numbers.isEmpty {
                    Text("Array: \(numbers.map(String.init).joined(separator: ", "))")
                }
                
                // Button to calculate and display the sum of even numbers
                Button("Sum Even Numbers") {
                    // Updates the message to display the sum
                    evenSumMessage = "Sum of even numbers: \(sumOfEvenNumbers(in: numbers))"
                }
                .disabled(numbers.isEmpty) // Disables this button if the array is empty
                .modifier(ButtonModifier())
                
                // Displays the message of the sum of even numbers
                Text(evenSumMessage)
                
                Spacer()
            }
            .padding()
        }
    }
}

func sumOfEvenNumbers(in array: [Int]) -> Int {
    // Calculates the sum of even numbers in the array
    return array.filter { $0 % 2 == 0 }.reduce(0, +)
}
