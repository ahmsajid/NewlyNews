//
//  MenuManager.swift
//  Newly News
//
//  Created by A H M Masfiqur Rahman Sajid on 5/3/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit

class MenuManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    //blackview is the variable for the view to become darker
    let blackView = UIView()
    //tableview for the menu
    let menuTableView = UITableView()
    let arrayOfSoruces = ["Daily Mail", "Business Insider UK"]
    
    public func openMenu() {
        
        //We are getting the window from the app delegate
        if let window = UIApplication.shared.keyWindow {
            //window.frame is blackView gets expanded
            blackView.frame = window.frame
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            //tap gesture to dismiss the menu
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissMenu)))
            
            //aligining the tableview to the bottom
            let height: CGFloat = 100
            //y is the bottom right of the screen
            let y = window.frame.height - height
            menuTableView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            window.addSubview(blackView)
            window.addSubview(menuTableView)
            
            UIView.animate(withDuration: 0.5, animations: { 
                self.blackView.alpha = 1
                
                //slide-out effect
                self.menuTableView.frame.origin.y = y
            })
        }
    }
    
    public func dismissMenu() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
               self.menuTableView.frame.origin.y = window.frame.height
            }
        })
    }
    
    //MARK: TableView Delegates and DataSources
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSoruces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCellId", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arrayOfSoruces[indexPath.item]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    override init() {
        super.init()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        menuTableView.isScrollEnabled = false
        menuTableView.bounces = false
        
        //registering the cell id
        menuTableView.register(BaseViewCellTableViewCell.classForCoder(), forCellReuseIdentifier: "menuCellId")
    }
}
