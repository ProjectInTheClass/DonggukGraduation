

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let time = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: time) {
            print("2초")
            if testV {
                testV = false
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstStoryboard")
                
                (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = viewController
                
            }
            else {
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PDVCStoryboard")
                
                (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = viewController
            }
        }
        
    }
    


}
