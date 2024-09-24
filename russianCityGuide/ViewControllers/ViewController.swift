//
//  ViewController.swift
//  russianCityGuide
//
//  Created by lonely. on 26.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var animator = UIDynamicAnimator()
    var imageView = UIImageView()
    let continueButton = UIButton()
    let mapImage = UIImage(named: "russiaMap")
    let text = "asd"
    let mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .none
        view.backgroundColor = UIColor(named: "backColor")
        createMap()
        showLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImage()
        showButton()
    }

    func createMap(){
        imageView = UIImageView(image: mapImage)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: Int(self.view.center.x), y: -100, width: 300, height: 300)
        view.addSubview(imageView)
    }
    
    func animateImage(){
        animator = UIDynamicAnimator(referenceView: view)
        let snapMap = UISnapBehavior(item: imageView, snapTo: view.center)
        snapMap.damping = 1.2
        animator.addBehavior(snapMap)
        UIView.animate(withDuration: 2.7) {
            self.continueButton.alpha = 1
        }
    }
    
    func showLabel(){
        mainLabel.text = "Russian City Guide"
        mainLabel.textColor = UIColor(named: "textColor")
        mainLabel.font = UIFont(name: "RubikMonoOne-Regular", size: 30)
        mainLabel.textAlignment = .left
        mainLabel.numberOfLines = 3
        mainLabel.lineBreakMode = .byWordWrapping
        mainLabel.frame = CGRect(x: 0, y: 30, width: 200, height: 300)
        mainLabel.center.x = view.center.x
        view.addSubview(mainLabel)
    }
    
    func showButton(){
        continueButton.setTitle("Go", for: .normal)
        continueButton.layer.cornerRadius = 25
        continueButton.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0)
        continueButton.backgroundColor = UIColor(named: "AccentColor")
        continueButton.frame = CGRect(x: 0, y: 0, width: 180, height: 80)
        continueButton.center.x = self.view.center.x
        continueButton.layer.borderColor = .init(red: 1, green: 0.4, blue: 0.2, alpha: 0.75)
        continueButton.layer.borderWidth = 5
        continueButton.addTarget(self, action: #selector(goToNextScreen(sender:)), for: .touchUpInside)
        continueButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        continueButton.setTitleColor(.black, for: .normal)
        view.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        //TODO: do attributed string
        //continueButton.setAttributedTitle(<#T##title: NSAttributedString?##NSAttributedString?#>, for: <#T##UIControl.State#>)
        
        continueButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
//        NSLayoutConstraint.activate([
//            NSLayoutConstraint.init(item: continueButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150),
//            NSLayoutConstraint.init(item: continueButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 75),
//            NSLayoutConstraint.init(item: continueButton, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 120),
//            NSLayoutConstraint.init(item: continueButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 100)
//        ])
        
    }
    
    @objc func goToNextScreen(sender: UIButton){
        let mainMenu = allCityScreen()
        UIView.animate(withDuration: 0.3) {
            sender.transform = .init(scaleX: 0.9, y: 0.9)
        } completion: { final in
            UIView.animate(withDuration: 0.2) {
                sender.transform = .init(scaleX: 1, y: 1)
            }
        }
        navigationController?.pushViewController(mainMenu, animated: true)
    }
    
}

