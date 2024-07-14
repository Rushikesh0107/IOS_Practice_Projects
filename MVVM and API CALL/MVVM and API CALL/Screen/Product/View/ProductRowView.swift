//
//  ProductRowView.swift
//  MVVM and API CALL
//
//  Created by Rushikesh Dadas on 13/07/24.
//

import Kingfisher
import SwiftUI

struct ProductRowView: View {
    
    let product : Product
    
    var body: some View {
        HStack{
            if !product.image.isEmpty {
                KFImage(URL(string: product.image)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
            }
            
            VStack(alignment: .leading, spacing: 8){
                Text(product.title)
                    .font(.headline)
                
                HStack{
                    Text(product.category)
                        .font(.subheadline)
                    
                    
                    Spacer()
                    
    
                    HStack{
                        Image(systemName: "star.fill")
                        
                        Text(product.rating.rate.toString())
                    }
                    .fontWeight(.medium)
                    .foregroundStyle(.yellow)
                }
                
                Text(product.description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
                HStack{
                    Text("$ " + product.price.toString())
                        .font(.title)
                        .foregroundStyle(.indigo)
                    
                    Spacer()
                    
                    Button(action: { }, label: {
                        Text("Buy")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .foregroundColor(.white)
                            .background(.indigo)
                            .clipShape(.capsule)
                    })
                }
            }
        }
        .padding()
    }
}

#Preview {
    ProductRowView(product : Product.dummy)
}
