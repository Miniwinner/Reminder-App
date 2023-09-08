//
//  CollectionModalsViewCell.swift
//  ReminderRebuild
//
//  Created by Александр Кузьминов on 4.09.23.
//

import UIKit

class CollectionModalsViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        self.addSubview(imageIcon)
        self.addSubview(textLabel)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageIcon: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
    
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.textColor = .black

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupUI(){
        self.backgroundColor = UIColor(red: 0.8824, green: 0.3647, blue: 0.1843, alpha: 0.5)
        
    }
    
    func config(with model: DataStructure) {
        imageIcon.image = UIImage(named: model.image)
        textLabel.text = model.text
    }
    
    
    
    func configureLayout(){
        NSLayoutConstraint.activate([
            imageIcon.widthAnchor.constraint(equalToConstant: self.bounds.width - 10),
//            imageIcon.heightAnchor.constraint(equalToConstant: self.bounds.height - 10),
            imageIcon.bottomAnchor.constraint(equalTo: textLabel.topAnchor,constant: -5),
            imageIcon.topAnchor.constraint(equalTo: self.topAnchor,constant: 0),
            imageIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0),
            
            textLabel.widthAnchor.constraint(equalToConstant: self.bounds.width),
            textLabel.heightAnchor.constraint(equalToConstant: 20),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -2),
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0)
        ])
    }
    
}
