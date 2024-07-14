//
//  ProductView.swift
//  MVVM and API CALL
//
//  Created by Rushikesh Dadas on 13/07/24.
//

import SwiftUI

struct ProductView: View {
    let viewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.products){ product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        ProductRowView(product: product)
                    }
                    
                }
            }
            .listStyle(.plain)
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductView()
}
