//
//  GroupViewModel.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 15/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation
class  GroupViewModel {
    
    var groups = [Group]()


    func getGroups(completion: @escaping (APIResult<String>)-> Void) {
        
        Providers.groupProvider.request(.getGroups) {  [weak self] (result) in
            switch result {
            case .success(let response):
                do {
                    let groupResponse : GroupResponse = try JSONDecoder().decode(GroupResponse.self, from: response.data)
                    if let groups = groupResponse.groups {
                        
                       self?.groups = groups.sorted(by: { $0.members!.count > $1.members!.count })
                        
                        self?.trainingBuddies()
                    }
                    
                    completion(.success("Groups Fetched"))
                    
                }
                catch {
                    completion(.failure(error.localizedDescription))
                }
                
            case .failure(let error):
                completion(.failure(error.localizedDescription))
                
            }
        }
    }
    
}

extension GroupViewModel {
    
    private func trainingBuddies() {
        
        for a in 0..<groups.count{
            
            for i in 0..<groups[a].members!.count-1 {
                for j in 0..<groups[a].members!.count where j != i {
                    self.trainingbuddies(member1: groups[a].members![i], member2: groups[a].members![j], groupindex: a, memberindex: i)
                }
            }
            
        }
        
        for group in self.groups {
            group.members = group.members?.filter({ return $0.istrainingBuddy
            })
        }
    }
    
    private func getSlowestBuddy(buddyGroup: [Member])-> Member? {
        
        return  buddyGroup.max(by: { (mem1, mem2) -> Bool in
            
            let pace1  = (mem1.memberActiveMinutes!/Double(mem1.memberDistanceCovered!))
            
            let pace2  = (mem2.memberActiveMinutes!/Double(mem2.memberDistanceCovered!))
            
            return pace1 < pace2
        })
        
    }
    
    private func trainingbuddies(member1: Member, member2: Member, groupindex: Int, memberindex: Int ) {
        
        let Mem1minPerKm = (member1.memberActiveMinutes!/Double(member1.memberDistanceCovered!))
        let Mem2minPerKm = (member2.memberActiveMinutes!/Double(member2.memberDistanceCovered!))
     
        
        if abs(Mem1minPerKm-Mem2minPerKm) <= 1 {
            
            member1.istrainingBuddy = true
            member2.istrainingBuddy = true
            
        }
        
    }
    
}

