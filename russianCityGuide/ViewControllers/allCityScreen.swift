//
//  allCityScreen.swift
//  russianCityGuide
//
//  Created by lonely. on 26.05.2024.
//

import UIKit
import RealmSwift

class allCityScreen: UIViewController {
    
    let label = UILabel()
    let realm = try! Realm()
    let scroll = UIScrollView()
    let countOfCities = 2
    var animator = UIDynamicAnimator()
    var buttons = [CityButton]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationItem.hidesBackButton = true
        self.navigationController?.topViewController?.title = "Гид по городам России"
        navigationController?.navigationBar.backgroundColor = UIColor(named: "backColor")
        createScrollView()
        createButtons()
    }
    
    
    func createButtons(){
        let allCities = realm.objects(City.self)
        let spb = allCities.first(where: {$0.name == "Санкт-Петербург"})
        let kgd = allCities.first(where: {$0.name == "Калининград"})
        let spbButton = CityButton(city: spb!, view: scroll)
        let kgdButton = CityButton(city: kgd!, view: scroll)
        spbButton.createButton()
        kgdButton.createButton()
        buttons.append(spbButton)
        buttons.append(kgdButton)
        kgdButton.addTarget(self, action: #selector(showCityVC(sender: )), for: .touchUpInside)
        spbButton.addTarget(self, action: #selector(showCityVC(sender: )), for: .touchUpInside)
        NSLayoutConstraint(item: buttons.last as Any, attribute: .bottom, relatedBy: .equal, toItem: scroll, attribute: .bottomMargin, multiplier: 1, constant: -25).isActive = true
    }
    
    func createScrollView(){
        scroll.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        scroll.isPagingEnabled = false
        scroll.frame = view.frame
        scroll.scrollsToTop = true
        scroll.canCancelContentTouches = false
        scroll.backgroundColor = UIColor(named: "backColor")
        view.addSubview(scroll)
    }
    
    @objc func showCityVC(sender:CityButton){
//        animator = UIDynamicAnimator(referenceView: view)
//        let snap = UISnapBehavior(item: sender, snapTo: CGPoint(x: -150, y: sender.center.y))
//        snap.damping = 1.3
//        animator.addBehavior(snap)
        UIView.animate(withDuration: 0.2) {
            sender.transform = .init(scaleX: 0.85, y: 0.85)
        } completion: { final in
            UIView.animate(withDuration: 0.3) {
                sender.transform = .init(scaleX: 1, y: 1)
            }
        }
        view.isHidden = true
        let cityPage = PageControllerTemplate()
        cityPage.city = sender.city
        self.navigationController?.pushViewController(cityPage, animated: true)
        //cityPage.throwCity()
    }
}
