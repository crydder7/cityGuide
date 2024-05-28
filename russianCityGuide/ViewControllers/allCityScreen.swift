//
//  allCityScreen.swift
//  russianCityGuide
//
//  Created by lonely. on 26.05.2024.
//

import UIKit

class allCityScreen: UIViewController {
    
    let label = UILabel()
    let scroll = UIScrollView()
    let countOfCities = 3
    var animator = UIDynamicAnimator()
    
    
    //MARK: Images for buttons
    let kgdPic = UIImage(named: "kgd")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let kgd = CityButton(name: "Калининград", photo: kgdPic!, currentVC: self, nextVC: ViewController())
        let kgdButton = kgd.createButton()
        kgdButton.addTarget(self, action: #selector(showCityVC(sender: )), for: .touchUpInside)
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationItem.hidesBackButton = true
        self.navigationController?.topViewController?.title = "Гид по городам России"
        self.navigationController?.topViewController?.view.backgroundColor = .lightGray
        view.backgroundColor = .white
        createScrollView()
        scroll.addSubview(kgdButton)
    }
    
    func createScrollView(){
        scroll.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        scroll.isPagingEnabled = false
        scroll.frame = view.frame
        view.addSubview(scroll)
    }
    
    @objc func showCityVC(sender:UIButton){
        animator = UIDynamicAnimator(referenceView: view)
        let snap = UISnapBehavior(item: sender, snapTo: CGPoint(x: -150, y: sender.center.y))
        snap.damping = 1.3
        animator.addBehavior(snap)
        UIView.animate(withDuration: 0.2) {
            sender.transform = .init(scaleX: 0.85, y: 0.85)
        } completion: { final in
            UIView.animate(withDuration: 0.3) {
                sender.transform = .init(scaleX: 1, y: 1)
            }
        }
        let cityPage = PageControllerTemplate()
        navigationController?.pushViewController(cityPage, animated: true)
    }
}
