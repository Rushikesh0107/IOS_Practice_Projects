//
//  AstronautDetailsView.swift
//  Moonshot
//
//  Created by Rushikesh Dadas on 30/06/24.
//

import SwiftUI

struct AstronautDetailsView: View {
    
    var astronaut : Astronaut
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) {width, axis in
                            width * 0.92
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(.white, lineWidth: 2)
                        }
                    
                    Text(astronaut.description)
                        .foregroundStyle(.white)
                        .padding()
                }
            }
            .navigationTitle(astronaut.name)
            .background(.darkBackground)
        }
    }
    
    
}

#Preview {
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautDetailsView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
