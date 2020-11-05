//
//  RestaurantTableViewController.swift
//  2
//
//  Created by NDHU_CSIE on 2020/10/22.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurantNames = ["watermellon","apple", "orange", "strawberry", "pear"]
    var restaurantImages = ["fruit", "fruit", "fruit", "fruit","fruit"]
    var restaurantLocations = ["500", "100", "90", "200", "150"]
    var pricecout = [500,100,90,200,150]
    var sum = 0
    
    @IBOutlet weak var output: UILabel!
    
    var restaurantIsVisited = Array(repeating: false, count: 5)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //建立一個選單作為動作清單
        
        let optionMenu = UIAlertController(title: nil, message:"What do you want to do ?", preferredStyle: .actionSheet)
        // Add Call action
        
        
        // Check-in action
        let checkInAction = UIAlertAction(title: "Select", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.restaurantIsVisited[indexPath.row] = true
            
            if self.restaurantIsVisited[indexPath.row]{
                
                self.sum += self.pricecout[indexPath.row]
                self.output.text = "Total price = " + String(self.sum)
            }
            
        })
        optionMenu.addAction(checkInAction)
        
        
        let UndoCheckInAction = UIAlertAction(title: "Unselect", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            if self.restaurantIsVisited[indexPath.row]{
                cell?.accessoryType = .none
                self.restaurantIsVisited[indexPath.row] = false
                self.sum -= self.pricecout[indexPath.row]
                self.output.text = "Total price = " + String(self.sum)
                
            }
        })
        optionMenu.addAction(UndoCheckInAction)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel,handler: nil)
        optionMenu.addAction(cancelAction)
        present(optionMenu, animated:  true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
        
        
        output.text = "Total price = " + String(sum)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        if restaurantIsVisited[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
