import UIKit
import MapKit

class TheaterMapViewController: UIViewController{
    @IBOutlet var map: MKMapView!
    var param: TheaterVO?
    override func viewDidLoad() {
        self.navigationItem.title = param?.TheaterName
        let location = CLLocationCoordinate2D(latitude: (param?.lat!)!, longitude: (param?.lng!)!)
        let radius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: radius, longitudinalMeters: radius)
        
        self.map.setRegion(coordinateRegion, animated: true)
        let point = MKPointAnnotation()
        point.coordinate = location
        
        self.map.addAnnotation(point)
    }
    
}
