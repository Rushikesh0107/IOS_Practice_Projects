//
//  ProductDetailView.swift
//  MVVM and API CALL
//
//  Created by Rushikesh Dadas on 13/07/24.
//

import Kingfisher
import SwiftUI

struct ProductDetailView: View {
    
    let product : Product
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            
            HStack{
                
                if !product.image.isEmpty {
                    KFImage(URL(string: product.image))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 300, alignment: .center)
                        .padding()
                }else {
                    ProgressView()
                }
            }
            
            
            Text(product.category)
                .font(.headline)
                .padding()
            
            Text(product.description)
                .font(.subheadline)
                .padding()
            
            HStack{
                HStack{
                    Image(systemName: "star.fill")
                    Text(product.rating.rate.toString() + " Rating")
                }
                .foregroundColor(.yellow)
                .font(.title3)
                
                Spacer()
            
                HStack{
                    Image(systemName: "circle.fill")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(product.rating.count.toString() + " Reviews")
                        .foregroundStyle(.secondary)
                        .font(.title3)
                }
                
                Spacer()
                
                HStack{
                    Image(systemName: "circle.fill")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(product.rating.count.toString() + " Sold")
                        .foregroundStyle(.secondary)
                        .font(.title3)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack{
                VStack{
                    Text("Total Price")
                    Text("$" + product.price.toString())
                        .font(.title)
                }
                
                Spacer()
                
                Button(action : {}) {
                    HStack(spacing: 0){
                        Image(systemName: "cart.fill.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background(.indigo)
                        
                        Text("Buy Now")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 75)
                            .padding()
                            .background(.black.opacity(0.75))
                    }
                    .foregroundStyle(.white)
                    .frame(height: 50)
                }
                .clipShape(.capsule)
            }
            .padding(.horizontal)
            .padding(.vertical, 25)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.25))
            )
            .padding()
        }
    }
}

#Preview {
    ProductDetailView(product: Product.dummy)
}
