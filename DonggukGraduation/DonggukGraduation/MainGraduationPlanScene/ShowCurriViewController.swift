
import UIKit

class ShowCurriViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let imageView = UIImageView(image: UIImage(named: "CSEcurri.png"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "이수체계도"
        
//        imageView.frame = CGRect(x: 0, y: 100, width: scrollView.frame.width, height: scrollView.frame.height)
        imageView.contentMode = UIView.ContentMode.center
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        scrollView.maximumZoomScale = 3.0
        scrollView.minimumZoomScale = 0.1
    }
    

}

extension ShowCurriViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
