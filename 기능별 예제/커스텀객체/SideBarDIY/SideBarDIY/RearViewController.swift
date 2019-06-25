//
//  RearViewController.swift
//  SideBarDIY
//
//  Created by Yongwan on 09/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class RearViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var title = "김용완 \n wanrage@naver.com"
        var lab = UILabel(frame: CGRect(x: 10, y: 0, width: self.view.frame.width, height: 70))
        lab.text = title
        lab.textColor = .white
        lab.font = UIFont.systemFont(ofSize: 15)
        lab.numberOfLines = 2
        
        
        var v = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        v.backgroundColor = .black
        v.addSubview(lab)
        self.tableView.tableHeaderView = v

        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "thisCell") ?? UITableViewCell(style: .default, reuseIdentifier: "thisCell")
        
        cell.textLabel?.text = "\(indexPath.row+1)번째 화면"
        cell.imageView?.image = UIImage(named: "icon0\(indexPath.row+1)")
        return cell
        
    }



}
