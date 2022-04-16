//
//  VideoCallViewModel.swift
//  Connecty
//
//  Created by Ali Aghamirbabaei on 4/15/22.
//

import SwiftUI

class VideoCallViewModel: ObservableObject {
    @Published public var people = [[Person]]()
    public var countOfMembersInCall = 1
    
    init() {
        addMember()
    }
    
    private func addMember() {
        var allMembers: [Person] = []
        
        //countOfMembersInCall += 1
        
        let names = ["Nathan", "George", "Brian", "Carl", "Tony", "Edward", "Roger", "Steve", "Paul", "Jack"]
        
        if countOfMembersInCall > 0 || countOfMembersInCall <= 3 {
            for id in (1...5).randomElements(countOfMembersInCall) {
                allMembers.append(Person(id: id, name: names[id], profilePicture: names[id], isSpeaking: false))
            }
            people.append(allMembers)
        }
        
        if countOfMembersInCall >= 4 {
            allMembers.removeAll()
            for id in (6...9).randomElements(countOfMembersInCall - 3) {
                allMembers.append(Person(id: id, name: names[id], profilePicture: names[id], isSpeaking: false))
            }
            people.append(allMembers)
        }
        
        print("People group 1: \(people[0].count)")
        print("People group 2: \(people[1].count)")
        
        people.shuffle()
    }
    
    func handleUI() {
        
    }
}
