import UIKit

class ListViewController: UITableViewController{
    var texts: [String] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell")!
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = self.texts[indexPath.row]
        return cell
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let len = texts[indexPath.row].count
//        return CGFloat(integerLiteral: Int(tableView.rowHeight) + (len/10)*10)
//    }
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "텍스트 추가", message: "텍스트를 추가해주세요", preferredStyle: .alert)
        alert.addTextField(){(tf) in
            tf.placeholder = "텍스트 입력"
        }
        let addText = UIAlertAction(title: "추가", style: .default){(_) in
            if let text = alert.textFields?[0].text{
                self.texts.append(text)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(addText)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}
