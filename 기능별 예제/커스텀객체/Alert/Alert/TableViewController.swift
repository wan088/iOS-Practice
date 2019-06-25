//
//  TableViewController.swift
//  Alert
//
//  Created by Yongwan on 06/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var delegate :ViewController?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row + 1)번째 행입니다."
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true){
            self.delegate?.cellPrint(row: indexPath.row)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize.height = 300
        
    }
    
}
