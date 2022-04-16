//
//  VCMembers.swift
//  Connecty
//
//  Created by Ali Aghamirbabaei on 4/16/22.
//

import SwiftUI

struct VCMembers: View {
    @EnvironmentObject var viewModel: VideoCallViewModel
    
    var body: some View {
        VStack {
            HStack {
                ForEach(viewModel.people[0], id: \.id) { people in
                    VCPerson(name: people.name, profilePicture: people.profilePicture, isSpeaking: people.isSpeaking)
                }
            }
            
            if viewModel.countOfMembersInCall >= 4 {
                HStack {
                    ForEach(viewModel.people[1], id: \.id) { people in
                        VCPerson(name: people.name, profilePicture: people.profilePicture, isSpeaking: people.isSpeaking)
                    }
                }
            }
        }
    }
}

struct VCMembers_Previews: PreviewProvider {
    static var previews: some View {
        VCMembers()
            .environmentObject(VideoCallViewModel())
    }
}
