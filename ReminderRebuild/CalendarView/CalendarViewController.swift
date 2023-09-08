//
//  CalendarViewController.swift
//  ReminderRebuild
//
//  Created by Александр Кузьминов on 26.08.23.
//

import UIKit

class CalendarViewController: UIViewController {
    
    let layoutCompositional = CompositionalLayoutFunctions()
    let viewModel = ViewModelData()
    weak var calendarDelegate:CalendarDelegate?
    
    var indexOfCell: Int = 0 {
            didSet {
                collectionViewModes.reloadData()
                collectionDays.reloadData()
                collectionViewCalendar.reloadData()
                
                collectionViewCalendar.collectionViewLayout = getCalendarLayout()
                collectionDays.collectionViewLayout = getDaysLayout()
            }
        }
    
    
    lazy var collectionViewCalendar: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    lazy var collectionViewModes:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    lazy var collectionDays:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.0, green: 0.9059, blue: 0.8196, alpha: 1.0)
        
        
        collectionViewCalendar.delegate = self
        collectionViewCalendar.dataSource = self
        collectionViewModes.delegate = self
        collectionViewModes.dataSource = self
        collectionDays.delegate = self
        collectionDays.dataSource = self
        
        view.addSubview(collectionViewModes)
        view.addSubview(collectionViewCalendar)
        view.addSubview(collectionDays)
        configureLayout()
        
        collectionViewModes.collectionViewLayout = layoutCompositional.layoutModesCaseOne()
        collectionViewCalendar.collectionViewLayout = layoutCompositional.layoutCalendarCaseOne()
        collectionDays.collectionViewLayout = layoutCompositional.layoutDaysCaseOne()
        
        
        collectionViewCalendar.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "calendar")
        collectionViewModes.register(CollectionModalsViewCell.self, forCellWithReuseIdentifier: "mode")
        collectionDays.register(CollectionDaysViewCell.self, forCellWithReuseIdentifier: "day")
    }
    
    private func getCalendarLayout() -> UICollectionViewLayout {
            switch indexOfCell {
            case 0:
                return layoutCompositional.layoutCalendarCaseOne()
            case 1:
                return layoutCompositional.layoutCalendarCaseTwo()
            default:
                return UICollectionViewFlowLayout()
            }
        }
    
    private func getDaysLayout() -> UICollectionViewLayout {
           switch indexOfCell {
           case 0:
               return layoutCompositional.layoutDaysCaseOne()
           case 1:
               return layoutCompositional.layoutDaysCaseTwo()
           default:
               return UICollectionViewFlowLayout()
           }
       }
     
    func configureLayout(){
        NSLayoutConstraint.activate([
            collectionViewCalendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            collectionViewCalendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionViewCalendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionViewCalendar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),

            
            collectionViewModes.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            collectionViewModes.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            collectionViewModes.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            collectionViewModes.bottomAnchor.constraint(equalTo: collectionDays.topAnchor,constant: -10),
            
            collectionDays.bottomAnchor.constraint(equalTo: collectionViewCalendar.topAnchor,constant: -10),
            collectionDays.heightAnchor.constraint(equalToConstant: 20),
            collectionDays.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            collectionDays.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
}

extension CalendarViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewModes {
            indexOfCell = indexPath.row
        
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
                case collectionViewModes:
                    return 4
                case collectionViewCalendar:
                    switch indexOfCell {
                    case 0:
                        return viewModel.numberOfRowsCalendar()
                    case 1:
                        return viewModel.numberOfRowsHours() * 8
                    default:
                        return 0
                    }
                case collectionDays:
                    switch indexOfCell {
                    case 0:
                        return viewModel.numberOfRowsWeekOne()
                    case 1:
                        return viewModel.numberOfRowsWeekTwo()
                    default:
                        return 0
                    }
                default:
                    return 0
                }
            }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewModes{
            let cell = collectionViewModes.dequeueReusableCell(withReuseIdentifier: "mode", for: indexPath) as! CollectionModalsViewCell
            cell.config(with: viewModel.getData(at: indexPath.row) ?? DataStructure(image: "rabbit", text: "N/A"))
            return cell
            
        }else if collectionView == collectionDays{
            let cell = collectionDays.dequeueReusableCell(withReuseIdentifier: "day", for: indexPath) as! CollectionDaysViewCell
            switch indexOfCell{
            case 0:cell.configDayCell(with: viewModel.getDaysItemOne(at: indexPath.row))
                
            case 1:cell.configDayCell(with: viewModel.getDaysItemTwo(at: indexPath.row))
                
            default:print("OUT OF INDEX DAYS")
            }
            
            
            return cell
        }
        
        else if collectionView == collectionViewCalendar{
            let cell = collectionViewCalendar.dequeueReusableCell(withReuseIdentifier: "calendar", for: indexPath) as! CalendarCollectionViewCell
            switch indexOfCell{
            case 0:cell.config(with: viewModel.getCalendarItem(at: indexPath.row))
               
            case 1:if indexPath.row == 0 || indexPath.row % 8 == 0{
                cell.config(with: viewModel.getHourItem(at: indexPath.row))
            }else{
                cell.config(with: nil)
            }
                
                cell.config(with: viewModel.getHourItem(at: indexPath.row))
            
            
                
            default:print("OUT OF INDEX CALENDAR")
            }
        
            return cell
        }
        return UICollectionViewCell()
    }
}

    

