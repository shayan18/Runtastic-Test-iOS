//
//  GroupDetailsViewController.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 16/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation
import UIKit

class GroupDetailsViewController: UIViewController, Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    
    var memberlist = [Member]()
    
    override func viewDidLoad() {
        super.viewDidLoad()


}
}

extension GroupDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifers.memberCell, for: indexPath) as! MemberTableViewCell
        cell.member = memberlist[indexPath.row]
       return cell
    }
    
    
}
