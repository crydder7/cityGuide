//
//  PageControllerTemplate.swift
//  russianCityGuide
//
//  Created by lonely. on 28.05.2024.
//

import UIKit

class PageControllerTemplate: UIPageViewController {
    
    let name = "Калининград"
    let pastVC = allCityScreen()
    var animator = UIDynamicAnimator()
    var str = AttributedString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(goBack(sender:)))
        //view.addSubview(pastVC.view)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        //showThisView()
    }
    
    func showThisView(){
        animator = UIDynamicAnimator(referenceView: self.view)
        let snap = UISnapBehavior(item: pastVC.view, snapTo: CGPoint(x: -500, y: -200))
        snap.damping = 0.7
        animator.addBehavior(snap)
    }
    
    @objc func goBack(sender:UIButton){
        guard let indecies = navigationController?.viewControllers.endIndex else {return}
        let prevIndex = indecies - 2
        navigationController?.viewControllers[prevIndex].viewDidLoad()
        let prevCon = allCityScreen()
        navigationController?.popViewController(animated: true)
    }

}
