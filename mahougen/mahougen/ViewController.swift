import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    @IBOutlet weak var mahouView: MahouView!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.adUnitID = "ca-app-pub-2359565431337443/6432525275"
        bannerView.rootViewController = self
        bannerView.loadRequest(GADRequest())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onClickShare(sender: UIButton) {
        
        let layer = UIApplication.sharedApplication().keyWindow?.layer;
        
        let scale = UIScreen.mainScreen().scale;
        UIGraphicsBeginImageContextWithOptions(mahouView.frame.size, false, scale);
        
        layer!.renderInContext(UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        let activityItem: [AnyObject] = [" #mahougen", screenshot]
        let avc = UIActivityViewController(activityItems: activityItem as [AnyObject], applicationActivities: nil)
        self.presentViewController(avc, animated: true, completion: nil)
    }
    
    @IBAction func onClickReset(sender: UIButton) {
        mahouView.clear()
    }
    @IBAction func sliderChanged(sender: UISlider) {
        let count = Int(sender.value)
        mahouView.setVertex(count)
    }
}

