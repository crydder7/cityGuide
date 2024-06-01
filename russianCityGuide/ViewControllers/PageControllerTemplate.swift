import UIKit

class PageControllerTemplate: UIPageViewController {
    
    let name = "Калининград"
    var animator = UIDynamicAnimator()
    var str = AttributedString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(goBack(sender:)))
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        //showThisView()
    }
    
    @objc func goBack(sender:UIButton){
        navigationController?.popViewController(animated: true)
        navigationController?.viewControllers.last?.view.isHidden = false
    }
}
