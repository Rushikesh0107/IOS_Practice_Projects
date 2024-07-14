//
//  MissionDetailView.swift
//  Moonshot
//
//  Created by Rushikesh Dadas on 30/06/24.
//

import SwiftUI

struct MissionDetailView: View {
    struct CrewMember {
        let astronaut: Astronaut
        let role : String
    }
    
    var mission : Mission
    var crew : [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {width, axis in
                        width * 0.6
                    }
                
                Rectangle()
                    .frame(height: 2)
                    .padding(.vertical)
                    .foregroundStyle(.lightBackground)
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom)
                    
                    Text(mission.description)
                }
                
                Rectangle()
                    .frame(height: 2)
                    .padding(.vertical)
                    .foregroundStyle(.lightBackground)
                
                Text("Crew Details")
                    .font(.title.bold())
            }
            .padding(.horizontal)
            
            ScrollView( showsIndicators: false){
                VStack{
                    ForEach(crew, id: \.role) {crewMember in
                        NavigationLink {
                            AstronautDetailsView(astronaut: crewMember.astronaut)
                        } label : {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .strokeBorder(.white, lineWidth: 1)
                                    )
                                
//                                Spacer()
                                
                                VStack() {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(crewMember.role)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .frame(maxWidth: .infinity, alignment : .center)
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .strokeBorder(.lightBackground, lineWidth: 1.5)
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts : [String : Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(astronaut: astronaut, role: member.role)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions : [Mission] = Bundle.main.decode("missions.json")
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionDetailView(mission: missions[0], astronauts : astronauts)
                .preferredColorScheme(.dark)
}
