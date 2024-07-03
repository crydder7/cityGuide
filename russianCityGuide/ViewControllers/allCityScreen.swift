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
    var buttons = [CityButton]()
    
    //MARK: Images for buttons
    let kgdPic = R.image.kgd()! as UIImage
    let spbImage = R.image.spb()! as UIImage

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationItem.hidesBackButton = true
        self.navigationController?.topViewController?.title = "Гид по городам России"
        self.navigationController?.topViewController?.view.backgroundColor = .lightGray
        view.backgroundColor = .white
        createScrollView()
        createButtons()
    }
    
    
    func createButtons(){
        let spb = City(name: "Санкт-Петербург", picForButton: spbImage, description: """
     Город на Неве основан Петром I-ым в 1703 году.
     """, photos: [spbImage])
        let kgd = City(name: "Калининград", picForButton: kgdPic, description: """
    Самый западный город России с населением около полумилиона человек.
    """, photos: [kgdPic])
        
        let kgdButton = CityButton(city: kgd, view: scroll)
        kgdButton.createButton()
        kgdButton.addTarget(self, action: #selector(showCityVC(sender: )), for: .touchUpInside)
        buttons.append(kgdButton)
        
        let spbButton = CityButton(city: spb, view: scroll)
        spbButton.createButton()
        spbButton.addTarget(self, action: #selector(showCityVC(sender: )), for: .touchUpInside)
        buttons.append(spbButton)
        
        NSLayoutConstraint(item: buttons.last as Any, attribute: .bottom, relatedBy: .equal, toItem: scroll, attribute: .bottomMargin, multiplier: 1, constant: -25).isActive = true
    }
    
    func createScrollView(){
        scroll.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        scroll.isPagingEnabled = false
        scroll.frame = view.frame
        scroll.scrollsToTop = true
        scroll.canCancelContentTouches = false
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
//        cityPage.throwCity()
        navigationController?.pushViewController(cityPage, animated: true)
    }
}
