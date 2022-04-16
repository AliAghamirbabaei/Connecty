//
//  VCPerson.swift
//  Connecty
//
//  Created by Ali Aghamirbabaei on 4/15/22.
//

import SwiftUI

struct VCPerson: View {
    @State var name: String
    @State var profilePicture: String
    @State var isSpeaking: Bool
    @State private var dotOpacity: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            GeometryReader { proxy in
                let size = proxy.size
                
                Image(profilePicture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(35)
            }
            
            Capsule()
                .fill(.thinMaterial)
                .frame(width: 100, height: 40)
                .overlay{
                    HStack {
                        if isSpeaking {
                            Circle()
                                .fill(.blue)
                                .frame(width: 10, height: 10)
                                .blur(radius: 2)
                                .opacity(dotOpacity)
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        dotOpacity = 1
                                    }
                                }
                        }
                        
                        Text(name)
                            .font(.custom("Quicksand-Regular", size: 18))
                    }
                }
                .padding()
        }
        .preferredColorScheme(.dark)
    }
}


struct VCPerson_Previews: PreviewProvider {
    static var previews: some View {
        VCPerson(name: "Edward", profilePicture: "Edward", isSpeaking: true)
    }
}
