import UIKit

class TheaterViewController: UITableViewController{
    var theaters:[TheaterVO] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theaters.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let thisCell = tableView.dequeueReusableCell(withIdentifier: "TheaterCell") as! TheaterCell
        thisCell.TheaterName.text = theaters[indexPath.row].TheaterName
        thisCell.TheaterAddress.text = theaters[indexPath.row].TheaterAddress
        thisCell.TheaterPh.text = theaters[indexPath.row].TheaterPh
        
        return thisCell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "locationSegue"{
            let th = theaters[self.tableView.indexPath(for: sender as! TheaterCell)!.row]
            let dest = segue.destination as! TheaterMapViewController
            dest.param = th
            
        }
    }
    
    override func viewDidLoad() {
        
        do {
            let url: URL! = URL(string: "http://swiftapi.rubypaper.co.kr:2029/theater/list?s_page=1&s_list=100&type=json")!
            print("dho")
            let stringData = try! NSString(contentsOf: url, encoding: 0x80_000_422)
            let encdata = stringData.data(using: String.Encoding.utf8.rawValue)
            
            let array = try! JSONSerialization.jsonObject(with: encdata!, options: []) as! NSArray
            print("여긴?")
            for a in array{
                let th = a as! NSDictionary
                let vo = TheaterVO()
                vo.TheaterName = th["상영관명"] as? String
                vo.TheaterPh = th["연락처"] as? String
                vo.TheaterAddress = th["소재지도로명주소"] as? String
                vo.lat = (th["위도"] as! NSString).doubleValue
                vo.lng = (th["경도"] as! NSString).doubleValue
                theaters.append(vo)
            }
            
        } catch{
            print("머지")
        }
        self.tableView.reloadData()
    }
}
