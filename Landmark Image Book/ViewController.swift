//
//  ViewController.swift
//  Landmark Image Book
//
//  Created by Kornet Project on 15/08/2017.
//  Copyright © 2017 Kornet Project. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var landmarkNamesArray = [String]()
    var landmarkImageArray = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view setup
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //example array creation
        landmarkNamesArray.append("Collesieum")
        landmarkNamesArray.append("Great Wall")
        landmarkNamesArray.append("Kremlin")
        landmarkNamesArray.append("Taj Mahal")
        
        landmarkImageArray.append(UIImage(named: "collesieum.jpg")!)
        landmarkImageArray.append(UIImage(named: "wall.jpg")!)
        landmarkImageArray.append(UIImage(named: "kremlin.jpg")!)
        landmarkImageArray.append(UIImage(named: "tajmahal.jpg")!)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNamesArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNamesArray.remove(at: indexPath.row)
            landmarkImageArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageVCSegue" {
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.selectedLandmarkName = chosenLandmarkName
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chosenLandmarkName = landmarkNamesArray[indexPath.row]
        self.chosenLandmarkImage = landmarkImageArray[indexPath.row]
        performSegue(withIdentifier: "toImageVCSegue", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNamesArray[indexPath.row]
        return cell
    }

}

