//
//  VCControls.swift
//  Connecty
//
//  Created by Ali Aghamirbabaei on 4/15/22.
//

import SwiftUI

struct VCControls: View {
    var viewModel: VideoCallViewModel
    @State var isAddButtonDisabled: Bool = false
    
    var body: some View {
        ZStack{
            Capsule()
                .fill(.ultraThinMaterial)
                .frame(height: 80)
            
            HStack {
                Button(action: {}) {
                    Image("Voice-2")
                        .resizable()
                        .frame(width: 25, height: 31)
                        .background(
                            Circle()
                                .fill(.ultraThinMaterial)
                                .frame(width: 55, height: 55)
                        )
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image("Video")
                        .resizable()
                        .frame(width: 30, height: 20)
                        .background(
                            Circle()
                                .fill(.ultraThinMaterial)
                                .frame(width: 55, height: 55)
                        )
                }
                
                Spacer()
                
                Button(action: {
                    if viewModel.countOfMembersInCall >= 6 {
                        isAddButtonDisabled.toggle()
                        viewModel.addMember()
                    } else {
                        viewModel.addMember()
                    }
                }) {
                    Image("Add-User")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .background(
                            Circle()
                                .fill(.ultraThinMaterial)
                                .frame(width: 55, height: 55)
                        )
                }
                .disabled(isAddButtonDisabled)
                .opacity(isAddButtonDisabled ? 0.3 : 1)
                
                Spacer()
                
                Button(action: {}) {
                    Image("Call-Silent")
                        .resizable()
                        .frame(width: 29, height: 30)
                        .background(
                            Circle()
                                .fill(.red)
                                .frame(width: 55, height: 55)
                        )
                }
            }
            .padding(.horizontal, 35)
        }
        .padding(.horizontal)
        .preferredColorScheme(.dark)
    }
}

struct VCControls_Previews: PreviewProvider {
    static var previews: some View {
        VCControls(viewModel: VideoCallViewModel())
    }
}
