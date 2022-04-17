//
//  VCMembers.swift
//  Connecty
//
//  Created by Ali Aghamirbabaei on 4/16/22.
//

import SwiftUI

struct VCMembers: View {
    @State private var userOpacity: CGFloat = 0
    @EnvironmentObject var viewModel: VideoCallViewModel
    
    var body: some View {
        VStack {
            if viewModel.countOfMembersInCall != 0 {
                HStack {
                    ForEach(viewModel.people[0], id: \.id) { people in
                        VCPerson(user: people)
                            .opacity(userOpacity)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1)) {
                                    userOpacity = 1
                                }
                            }
                    }
                }
            }
            
            if viewModel.countOfMembersInCall >= 4 {
                HStack {
                    ForEach(viewModel.people[1], id: \.id) { people in
                        VCPerson(user: people)
                            .opacity(userOpacity)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1)) {
                                    userOpacity = 1
                                }
                            }
                    }
                }
            }
        }
    }
}

struct VCMembers_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VCMembers()
                .environmentObject(VideoCallViewModel())
        }
    }
}
