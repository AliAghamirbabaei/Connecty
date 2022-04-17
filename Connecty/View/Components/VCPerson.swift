//
//  VCPerson.swift
//  Connecty
//
//  Created by Ali Aghamirbabaei on 4/15/22.
//

import SwiftUI

struct VCPerson: View {
    var user: Person
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if user.isSpeaking {
                RoundedRectangle(cornerRadius: 35)
                    .stroke(.blue, lineWidth: 4)
                    .blur(radius: 1)
                    .padding(7)
            }
            
            GeometryReader { proxy in
                let size = proxy.size
                
                Image(user.profilePicture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(30)
            }
            .padding()
            
            Capsule()
                .fill(.thinMaterial)
                .frame(width: 100, height: 40)
                .overlay{
                    HStack {
                        if user.isSpeaking {
                            Circle()
                                .fill(.blue)
                                .frame(width: 10, height: 10)
                                .blur(radius: 2)
                        }
                        
                        Text(user.name)
                            .font(.custom("Quicksand-Regular", size: 18))
                    }
                }
                .padding(30)
        }
        .preferredColorScheme(.dark)
    }
}


struct VCPerson_Previews: PreviewProvider {
    static var previews: some View {
        VCPerson(user: Person(id: 1, name: "Edward", profilePicture: "Edward", isSpeaking: true))
    }
}
