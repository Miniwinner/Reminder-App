//
//  ViewController.swift
//  ReminderRebuild
//
//  Created by Александр Кузьминов on 22.08.23.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    lazy var backGroundView:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = CGColor(red: 0.8824, green: 0.3647, blue: 0.1843, alpha: 0.5)
        return view
    }()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        
        self.delegate = self
       
        
        view.addSubview(backGroundView)
        makeConstraints()
    }
    
    
    
    private func generateTabBar(){
     
        viewControllers = [generateVC(viewController: DoneTaskViewController(), title: "Done", image: UIImage(systemName: "house.fill")),
                           generateVC(viewController: CalendarViewController(), title: "Calendar", image: UIImage(systemName: "person.fill")),
                           generateVC(viewController: ProfileViewController(), title: "Profile", image: UIImage(systemName: "slider.horizontal.3"))]
    }
    
    private func generateVC(viewController:UIViewController,title:String,image:UIImage?)->UIViewController{
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
    
    
    
    func makeConstraints(){
        backGroundView.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor,constant: 1000).isActive = true
        backGroundView.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor,constant: 1000).isActive = true
        backGroundView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        backGroundView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController:UIViewController) {

        

        if let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController),
           selectedIndex + 1 < tabBarController.tabBar.subviews.count,
           let selectedItemFrame = tabBarController.tabBar.subviews[selectedIndex + 1] as? UIControl{

            let itemCenterX = selectedItemFrame.frame.origin.x + selectedItemFrame.frame.size.width / 2
            let itemCenterY = selectedItemFrame.frame.origin.y + 800
//            backGroundView.center = CGPoint(x: itemCenterX, y: itemCenterY - 5)



            UIView.animate(withDuration: 0.6, delay: 0, options: [.curveEaseInOut], animations: {
                       self.backGroundView.center = CGPoint(x: itemCenterX, y: itemCenterY - 5)
                   }, completion: nil)



            UIView.transition(with: tabBarController.view, duration: 0.4, options: [.transitionCrossDissolve], animations: nil, completion: nil)
        }

    }

}
