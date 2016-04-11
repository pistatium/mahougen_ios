import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mahouView: MahouView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil);
        
    }
    @IBAction func onClickReset(sender: UIButton) {
        mahouView.clear()
    }
    @IBAction func sliderChanged(sender: UISlider) {
        let count = Int(sender.value)
        mahouView.setVertex(count)
    }
}

