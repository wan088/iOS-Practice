import UIKit
import SafariServices
import WebKit
class ListViewController: UITableViewController{
    var page = 1
    var list: [MovieVO] = []
    
    
    
    @IBAction func webBtn(_ sender: Any) {
        let naver: URL! = URL(string: "https://www.naver.com")
//        UIApplication.shared.open(naver!, options: [:])
        let sfvc = SFSafariViewController(url: naver)
        self.present(sfvc, animated: true)
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellData = list[indexPath.row]
        
        let viewCell = tableView.dequeueReusableCell(withIdentifier: "ListCell")! as! MovieCell
        
        viewCell.title.text = cellData.title
        viewCell.desc.text = cellData.description
        viewCell.rating.text = "\(cellData.rating!)"
        DispatchQueue.main.async {
            viewCell.iv.image = self.getThumbnailImage(idx: indexPath.row)!
        }
        return viewCell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! webViewController
        
        dest.movie = list[self.tableView.indexPath(for: sender as! MovieCell)!.row]
        
    }
    override func viewDidLoad() {
        callMovieApi()
    }
    @IBAction func more(_ sender: Any) {
        page+=1
        callMovieApi()
    }
    @IBOutlet var moreBtn: UIButton!
    
    
    
    func callMovieApi(){
        let apiUrl: URL! = URL(string: "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc")
        let apiData = try! Data(contentsOf: apiUrl)
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            for row in movie{
                let r = row as! NSDictionary
                let mvo: MovieVO = MovieVO()
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.rating = (r["ratingAverage"] as! NSString).doubleValue
                mvo.detail = r["linkUrl"] as? String
                mvo.thumbnailUrlString = r["thumbnailImage"] as? String
                self.list.append(mvo)
            }
            self.tableView.reloadData()
            
            let totalCount = (hoppin["totalCount"] as! NSString).intValue
            if(totalCount<=self.list.count){
                self.moreBtn.isHidden = true
            }
            
        } catch {}
    }
    func getThumbnailImage(idx :Int)-> UIImage? {
        if let img = list[idx].thumbnail{
            return img
        }else{
            list[idx].thumbnail = UIImage(data: try! Data(contentsOf: URL(string: list[idx].thumbnailUrlString!)!))
            return list[idx].thumbnail
        }
    }
}
