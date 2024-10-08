//
//  PhotosView.swift
//  russianCityGuide
//
//  Created by lonely. on 04.07.2024.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "PhotoCell"

class PhotosView: UICollectionViewController {
    
    var city: City!
    let wait = UIActivityIndicatorView()
    var urls = [String]()
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Register cell classes
        self.collectionView!.register(PhotosCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.backgroundColor = UIColor(named: "backColor")
        
        wait.style = .large
        wait.color = UIColor(named: "textColor")
        wait.hidesWhenStopped = true
        wait.center = self.collectionView.center
        wait.startAnimating()
        self.collectionView.addSubview(wait)
        fetchImageData { [weak self] imgData in
            guard let self else { return }
            guard let imgs = imgData else { return }
            for i in imgs{
                urls.append(i.urls.regular)
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) { [weak self] in
                guard let self else { return }
                self.wait.stopAnimating()
                collectionView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 8
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCell else { return UICollectionViewCell()}
        if urls.isEmpty { return cell }
        let url = URL(string: urls[indexPath.item])
        let resource = KF.ImageResource(downloadURL: url!)
        let img = UIImageView()
        img.kf.setImage(with: resource)
        cell.updateValues(img)
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    func fetchImageData(completion: @escaping ([ImageData]?) -> Void) {
        let urlString = city.url
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([ImageData].self, from: data)
                completion(decodedData)
            } catch {
                print("Ошибка декодирования: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
}

//54.710107, 20.510126
