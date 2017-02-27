//
//  ViewController.swift
//  FacebookFeed
//
//  Created by Admin on 26.02.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

let cellID = "cellID"

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Facebook Feed"
        
        collectionView?.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView?.alwaysBounceVertical = true
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
}

class FeedCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) gas not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        let attributedText = NSMutableAttributedString(string: "Mark Zuckerberg", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "\nDecember 18 * San Francisco * ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.init(red: 155/255, green: 161/255, blue: 171/255, alpha: 1) ]))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        attributedText.addAttribute(NSForegroundColorAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
        
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "zuckprofile")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]-8-|", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]|", views: profileImageView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, views) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = views
            views.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

