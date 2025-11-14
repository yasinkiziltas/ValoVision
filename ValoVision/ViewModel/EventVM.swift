//
//  EventVM.swift
//  ValoVision
//
//  Created by Yasin Kızıltaş on 15.11.2025.
//

import Foundation
import RxSwift
import RxCocoa

let events: PublishSubject<[EventData]> = PublishSubject()
let errorEvent: PublishSubject<String> = PublishSubject()

class EventVM {
    
    func requestEventData() {
        let url = URL(string: "https://valorant-api.com/v1/events")!
        
        NetworkService().getData(url: url) { (result: Result<[EventData], DataError>) in
            switch result {
            case .success(let response):
                events.onNext(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
