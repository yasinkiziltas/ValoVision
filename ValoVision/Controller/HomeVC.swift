//
//  ViewController.swift
//  ValoVision
//
//  Created by Yasin Kızıltaş on 13.11.2025.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let agentVM = AgentVM()
    var agentList = [Agent]()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupBindings()
        agentVM.requestAgentData()
    }
    
    private func setupBindings() {
        agentVM
            .agents
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { agentArray in
                self.agentList = agentArray
                self.tableView.reloadData()
            }, onError: { error in
                print("Hata:", error)
            })
            .disposed(by: disposeBag)
        
        agentVM
            .error
            .observe(on: MainScheduler.instance)
            .subscribe { errorString in
                    print(errorString)  
            }.disposed(by: disposeBag)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = agentList[indexPath.row].displayName
        content.secondaryText = agentList[indexPath.row].developerName
        cell.contentConfiguration = content
        return cell
    }
}
