//
//  AgentVM.swift
//  ValoVision
//
//  Created by Yasin Kızıltaş on 13.11.2025.
//

import Foundation
import RxSwift
import RxCocoa

let agents: PublishSubject<[AgentData]> = PublishSubject()
let error: PublishSubject<String> = PublishSubject()

class AgentVM {
    
    func requestAgentData() {
        
        let url = URL(string: "https://valorant-api.com/v1/agents")!

        NetworkService().getData(url: url) { (result: Result<[AgentData], DataError>) in
            
            switch result {
            case .success(let response):
                agents.onNext(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
    
