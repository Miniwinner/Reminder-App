//
//  CollectionDaysViewCell.swift
//  ReminderRebuild
//
//  Created by Александр Кузьминов on 5.09.23.
//

import UIKit

class CollectionDaysViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(daysLabel)
        self.backgroundColor = UIColor(red: 0.8824, green: 0.3647, blue: 0.1843, alpha: 0.5)
        setupConstraint()
    }
        
        
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var daysLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.textColor = .black

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    func configDayCell(with calendarItem: String?) {
        if let item = calendarItem {
            daysLabel.text = item
        } else {
            daysLabel.text = "N/A"
        }
    }
    
    
    func setupConstraint(){
        NSLayoutConstraint.activate([
            daysLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5),
            daysLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0),
            daysLabel.widthAnchor.constraint(equalToConstant: self.bounds.size.width),
            daysLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
}
