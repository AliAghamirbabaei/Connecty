//
//  VideoCallView.swift
//  Connecty
//
//  Created by Ali Aghamirbabaei on 4/15/22.
//

import SwiftUI

struct VideoCallView: View {
    @EnvironmentObject var viewModel: VideoCallViewModel
    
    var body: some View {
        ZStack {
            Color("BG")
            
            VStack{
                HStack {
                    Text("\(viewModel.countOfMembersInCall) Members")
                        .foregroundColor(.white)
                        .font(.custom("Quicksand-Bold", size: 34))
                        .padding()
                    
                    Spacer()
                }
                
                VCMembers()
                    .environmentObject(viewModel)
                    .frame(maxHeight: .infinity)
                    .padding()
                
                Spacer()
                
                VCControls(viewModel: viewModel)
            }
            .padding([.top, .bottom], 35)
        }
        .ignoresSafeArea()
    }
}

struct VideoCallView_Previews: PreviewProvider {
    static var previews: some View {
        VideoCallView()
    }
}
