//
//  VideoCallView.swift
//  Connecty
//
//  Created by Ali Aghamirbabaei on 4/15/22.
//

import SwiftUI

struct VideoCallView: View {
    var body: some View {
        ZStack {
            Color("BG")
            
            VStack{
                HStack {
                    Text("4 Members")
                        .foregroundColor(.white)
                        .font(.custom("Quicksand-Bold", size: 34))
                        .padding()
                    
                    Spacer()
                }
                
                Spacer()
                
                VCControls()
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
