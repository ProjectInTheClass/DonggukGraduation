
import UIKit

class ShowCurriViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let imageView = UIImageView(image: UIImage(named: "CSEcurri.png"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "이수체계도"
        
        imageView.contentMode = UIView.ContentMode.center
        
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        scrollView.maximumZoomScale = 3.0
        scrollView.minimumZoomScale = 0.1
        scrollView.showsHorizontalScrollIndicator = false
    }
    

}

extension ShowCurriViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
