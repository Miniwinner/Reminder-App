//
//  ViewModelData.swift
//  ReminderRebuild
//
//  Created by Александр Кузьминов on 4.09.23.
//

import Foundation


class ViewModelData{
    //MARK: ДАННЫЕ
    let daysOfweekOne:[String] = ["Пн","Вт","Ср","Чт","Пт","Сб","Вс"]
    let daysOfweekTwo:[String] = ["","Пн","Вт","Ср","Чт","Пт","Сб","Вс"]
    
    
    var currentDayData:[String] = []
    
    func chooseArray(at index:Int,for mode:Int)->String?{
        guard index >= 0,index <= currentDayData.count else { return nil }
        switch index{
        case 0: currentDayData = daysOfweekOne
            
        case 1: currentDayData = daysOfweekTwo
            
        default:print("ERROR")
        }
        return currentDayData[index]
    }
    
    let calendar:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28","29","30","31","32","33","34","35"]
    
    let hours:[String] = ["7:00","8:00","9:00","7:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"]
    
    var dataModel:[DataStructure] = [DataStructure(image: "calendar1", text: "Month"),DataStructure(image: "calendar2", text: "Week"),DataStructure(image: "calendar3", text: "Two Days"),DataStructure(image: "calendar4", text: "Today")]
    
    
    //MARK: ЗАПОЛНЕНИЕ ЯЧЕЕК
    
    func getData(at index: Int) -> DataStructure? {
           guard index >= 0, index < dataModel.count else { return nil }
           return dataModel[index]
       }
    
    func getCalendarItem(at index: Int) -> String? {
        guard index >= 0, index < calendar.count else { return nil }
        return calendar[index]
    }

    func getDaysItemOne(at index:Int) -> String? {
        guard index >= 0, index < daysOfweekOne.count else { return nil }
        return daysOfweekOne[index]
    }
    
    func getDaysItemTwo(at index:Int) -> String? {
        guard index >= 0, index < daysOfweekTwo.count else { return nil }
        return daysOfweekTwo[index]
    }
    
    func getHourItem(at index:Int) -> String?{
        guard index >= 0 ,index < hours.count else { return nil }
        return hours[index]
        
    }
    
    
    
    
    //MARK: КОЛИЧЕСВТО ЯЧЕЕК
    
    func numberOfRowsCalendar()->Int{
        return calendar.count
    }
    
    func numberOfRowsWeekOne()->Int{
        return daysOfweekOne.count
    }
    
    func numberOfRowsWeekTwo()->Int{
        return daysOfweekTwo.count
    }
    
    func numberOfRowsHours()->Int{
        return hours.count
    }
}
