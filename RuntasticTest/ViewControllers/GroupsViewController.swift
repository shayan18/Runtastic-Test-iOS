//
//  ViewController.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 15/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.

import UIKit

class GroupsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private lazy var groupViewModel = GroupViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        getGroups()
        
    }
    
    private func getGroups() {
        groupViewModel.getGroups { [weak self]   (result) in
            switch result {
            case .success(let successMsg):
                print(successMsg)
                self?.tableView.reloadData()
            
            case .failure(let error):
                print(error)
            }
        }
    }
    
   
}

extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.groupViewModel.groups.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifers.groupCell, for: indexPath) as! GroupTableViewCell
        
        cell.group = groupViewModel.groups[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let members =  groupViewModel.groups[indexPath.row].members {
            let vc = GroupDetailsViewController.instantiate()
            vc.memberlist = members
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
