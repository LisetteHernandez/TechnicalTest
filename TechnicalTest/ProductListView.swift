//
//  ProductListView.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import SwiftUI

// A SwiftUI view that lists products fetched from an API.
struct ProductListView: View {
    // The ProductService is observed for changes to the product data.
    @ObservedObject var productService = ProductService()

    var body: some View {
        // The navigation container for the view.
        NavigationView {
            // Stacking the content layers on top of each other.
            ZStack {
                // A vertical stack that arranges its children linearly.
                VStack(spacing: 10) {
                    // Title text for the exercise.
                    Text("Exercise 2: Table View Integration")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    // Instruction text for the exercise.
                    Text("Create an iOS app with a UITableView that displays a list of products. The app should fetch the product data from an API endpoint and display the product name and price in each table view cell.")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding()
                    
                    // A list that presents the products in a vertical list.
                    List(productService.products) { product in
                        VStack(alignment: .leading) {
                            // Displays the product title.
                            Text(product.title)
                                .font(.headline)
                            // Displays the product price.
                            Text(String(format: "$%.2f", product.price))
                                .font(.subheadline)
                        }
                    }
                    .background(.clear) // Sets the background of the list to be clear.

                    // A spacer that expands to make the VStack fill the space.
                    Spacer()
                }
                .padding() // Padding applied to the VStack content.
            }
        }
    }
}

// A preview provider for SwiftUI's canvas and Xcode's preview.
struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
