//
//  PhotosCell.swift
//  russianCityGuide
//
//  Created by lonely. on 04.07.2024.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    
    public var img = UIImageView()
    public var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayout(){
        self.contentView.layer.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        img.translatesAutoresizingMaskIntoConstraints = false
//        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.layer.cornerRadius = 15
        contentView.addSubview(img)
//        contentView.addSubview(label)
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        img.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        img.heightAnchor.constraint(equalToConstant: contentView.frame.height).isActive = true
        img.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        label.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
//        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        label.topAnchor.constraint(equalTo: img.bottomAnchor).isActive = true
//        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentMode = .scaleAspectFit
        img.layer.cornerCurve = .circular
//        label.layer.cornerRadius = contentView.layer.cornerRadius
//        label.textAlignment = .center
//        label.adjustsFontSizeToFitWidth = true
        contentView.clipsToBounds = true
        
    }
    
    func updateValues(_ img:UIImageView){
        self.img = img
        //self.label.text = text
        createLayout()
    }
}
