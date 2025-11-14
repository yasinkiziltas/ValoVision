//
//  ViewController.swift
//  ValoVision
//
//  Created by Yasin Kızıltaş on 13.11.2025.
//

import UIKit

class HomeVC: UIViewController {
    
    var agentList = [Agent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://valorant-api.com/v1/agents")!
        
        NetworkService().getData(url: url) { (result: Result<AgentData, DataError>) in
            switch result {
            case .success(let agents):
                self.agentList = agents.data
            case .failure(let error):
                print("Hata:", error)
            }
        }
    }
}

//print("Gelen agent sayısı:", agents.data.count)
//print("İlk agent:", agents.data.first?.displayName ?? "yok")
