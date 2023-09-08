//
//  CompositionalLayoutFunctions.swift
//  ReminderRebuild
//
//  Created by Александр Кузьминов on 6.09.23.
//

import Foundation
import UIKit

class CompositionalLayoutFunctions{
    //MARK: CALENDAR CASE ONE
    // width = 394
     func layoutCalendarCaseOne() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(54),
            heightDimension: .absolute(90)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, repeatingSubitem: item, count: 7)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 2
        section.contentInsets = .init(
            top: 2,
            leading: 1,
            bottom: 2,
            trailing: 2
        )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    //MARK: CALENDAR CASE TWO
    
     func layoutCalendarCaseTwo() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(47),
                
            heightDimension: .absolute(90)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, repeatingSubitem: item, count: 8)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 2
        section.contentInsets = .init(
            top: 2,
            leading: 1,
            bottom: 2,
            trailing: 2
        )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
        
    //MARK: MODES CASE ONE
    
     func layoutModesCaseOne() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(
                90),
            heightDimension: .absolute(65)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, repeatingSubitem: item, count: 4)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(7)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = .init(
            top: 20,
            leading: 6,
            bottom: 2,
            trailing: 5
        )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    //MARK: MODES CASE TWO

    
     func layoutModesCaseTwo() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(
                90),
            heightDimension: .absolute(65)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, repeatingSubitem: item, count: 4)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(7)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = .init(
            top: 20,
            leading: 6,
            bottom: 2,
            trailing: 5
        )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    //MARK: DAYS CASE ONE

    
     func layoutDaysCaseOne() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(
                54),
            heightDimension: .absolute(20)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, repeatingSubitem: item, count: 7)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 2
        section.contentInsets = .init(
            top: 2,
            leading: 1,
            bottom: 2,
            trailing: 2
        )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    //MARK: DAYS CASE TWO

    
     func layoutDaysCaseTwo() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .estimated(
                47),
            heightDimension: .absolute(20)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, repeatingSubitem: item, count: 8)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 2
        section.contentInsets = .init(
            top: 2,
            leading: 1,
            bottom: 2,
            trailing: 2
        )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
