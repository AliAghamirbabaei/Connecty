//
//  VideoCallViewModel.swift
//  Connecty
//
//  Created by Ali Aghamirbabaei on 4/15/22.
//

import SwiftUI

class VideoCallViewModel: ObservableObject {
    @Published public var people: [[Person]] = [[], []]
    public var countOfMembersInCall = 0
    private var isSecondSectionOpen: Bool = false
    private var speakTimer: Timer?
    
    init() {
        speakTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(makeEveryoneSpeak), userInfo: nil, repeats: true)
    }
    
    public func addMember() {
        countOfMembersInCall += 1
        
        let names = ["Nathan", "George", "Brian", "Carl", "Tony", "Edward", "Roger", "Steve", "Paul", "Jack"]
        var randomID: Int?
        if countOfMembersInCall != 0 {
            repeat {
                randomID = (0...9).randomElement()
            } while people[0].contains(where: {$0.id == randomID}) || people[1].contains(where: {$0.id == randomID})
            
            if people[0].count < 3 {
                withAnimation {
                    people[0].append(Person(id: randomID!, name: names[randomID!], profilePicture: names[randomID!], isSpeaking: false))
                }
            } else {
                isSecondSectionOpen = true
            }
            
            if isSecondSectionOpen {
                withAnimation {
                    people[1].append(Person(id: randomID!, name: names[randomID!], profilePicture: names[randomID!], isSpeaking: false))
                }
            }
        }
    }
    
    @objc private func makeEveryoneSpeak() {
        if !people[0].isEmpty {
            let canITalk = (0...1).randomElement()!.boolValue
            
            if canITalk {
                let randomMemberID = (0...people[0].count - 1).randomElement()!
                
                withAnimation {
                    people[0][randomMemberID].isSpeaking = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.people[0][randomMemberID].isSpeaking = false
                    }
                }
            }
        }
        
        if !people[1].isEmpty {
            let canITalk = (0...1).randomElement()!.boolValue
            
            if canITalk {
                let randomMemberID = (0...people[1].count - 1).randomElement()!
                
                withAnimation {
                    people[1][randomMemberID].isSpeaking = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.people[1][randomMemberID].isSpeaking = false
                    }
                }
            }
        }
    }
}
