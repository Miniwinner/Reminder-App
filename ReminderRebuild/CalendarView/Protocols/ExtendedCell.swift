//
//  ExtendedCell.swift
//  ReminderRebuild
//
//  Created by Александр Кузьминов on 5.09.23.
//

import Foundation

protocol CalendarDelegate:AnyObject{
    
    func didSelectItem(index:Int)
    
}



protocol updateData:AnyObject{
    
    func updateCalendarData(with viewModel:ViewModelData)
        
    
}
