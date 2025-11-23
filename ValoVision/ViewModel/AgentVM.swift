//
//  AgentVM.swift
//  ValoVision
//
//  Created by Yasin Kızıltaş on 13.11.2025.
//

import Foundation
import RxSwift
import RxCocoa

class AgentVM {
    
    let agents: PublishSubject<[Agent]> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()
    
    func requestAgentData() {
        
        let url = URL(string: "https://valorant-api.com/v1/agents")!

        NetworkService().getData(url: url) { (result: Result<AgentData, DataError>) in
            
            switch result {
                
            case .success(let response):
                self.agents.onNext(response.data)
                
            case .failure(let error):
                switch error {
                    
                case .parsingError:
                    DispatchQueue.main.async {
                        self.error.onNext("Data parsing error")
                    }
                case .serverError:
                    DispatchQueue.main.async {
                        self.error.onNext("Server Error")
                    }
                case .unknownError:
                    DispatchQueue.main.async {
                        self.error.onNext("Unknown Error")
                    }
                }
            }
        }
    }
}
    
