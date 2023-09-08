//
//  CalendarCollectionViewCell.swift
//  ReminderRebuild
//
//  Created by Александр Кузьминов on 27.08.23.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: MONTH SETUP
    
    lazy var labelNumber:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    //MARK: WEEK SETUP
    
    lazy var hourLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    
    
    private func setupUI() {
        
        self.backgroundColor = UIColor(red: 0.8824, green: 0.3647, blue: 0.1843, alpha: 0.5)
        self.addSubview(labelNumber)
        self.addSubview(hourLabel)
//        configureLayout()
    }
    
    func config(with calendarItem: String?) {
        if let item = calendarItem {
            labelNumber.text = item
        } else {
            labelNumber.text = "N/A"
        }
    }
    
    func configHour(with hourItem:String?){
        if let item = hourItem{
            hourLabel.text = item
        }else{
            hourLabel.text = "N/A"
        }
    }

    
    func configureLayout(){
        
        NSLayoutConstraint.activate([
        
        
        labelNumber.widthAnchor.constraint(equalToConstant: 15),
        labelNumber.heightAnchor.constraint(equalToConstant: 13),
        labelNumber.topAnchor.constraint(equalTo: self.topAnchor,constant: 3),
        labelNumber.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -3),
        
        
        
        hourLabel.widthAnchor.constraint(equalToConstant: 15),
        hourLabel.heightAnchor.constraint(equalToConstant: 13),
        hourLabel.topAnchor.constraint(equalTo: self.centerYAnchor,constant: 0),
        hourLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0)
        ])
    }
}
