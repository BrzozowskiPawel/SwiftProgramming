//
//  ViewController.swift
//  MealApp
//
//  Created by Paweł Brzozowski on 13/12/2021.
//

import UIKit



class ViewController: UIViewController {

    
    @IBOutlet weak var categoryTableView: UITableView!
    
    @IBOutlet weak var gridButton: UIButton!
    
    let sections = ["Salads", "Seafood", "Steak"]
    
    var recipeDictionary = [String:[Recipe]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create some dummy recipes for show
        let salads = [Recipe(recipeName:"Sunny Quinoa Salad", cardImage:"quinoa"),
                      Recipe(recipeName:"Sunny Quinoa Salad", cardImage:"quinoa"),
                      Recipe(recipeName:"Sunny Quinoa Salad", cardImage:"quinoa")]
        
        recipeDictionary[sections[0]] = salads
        
        let seafood = [Recipe(recipeName:"Sunny Quinoa Salad", cardImage:"quinoa"),
                      Recipe(recipeName:"Sunny Quinoa Salad", cardImage:"quinoa"),
                      Recipe(recipeName:"Sunny Quinoa Salad", cardImage:"quinoa")]
        
        recipeDictionary[sections[1]] = seafood
        
        let steak = [Recipe(recipeName:"Sunny Quinoa Salad", cardImage:"quinoa"),
                       Recipe(recipeName:"Sunny Quinoa Salad", cardImage:"quinoa"),
                       Recipe(recipeName:"Sunny Quinoa Salad", cardImage:"quinoa")]
        
        recipeDictionary[sections[2]] = steak
        
        // Configure the tableview
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        
        // Configure the grid button
        gridButton.layer.borderColor = UIColor.black.cgColor
        gridButton.layer.borderWidth = 1
        gridButton.layer.cornerRadius = 3
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "RecipeDetail") as! RecipeDetailViewController
        
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        present(vc, animated: true, completion: nil)
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = sections[section]
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        
        // Header view
        let headerView = UIView()
        headerView.addSubview(label)
        
        // Add positioning constraints
        let leftConstraint = NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: headerView, attribute: .left, multiplier: 1, constant: 20)
        
        let yCenterConstraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: headerView, attribute: .centerY, multiplier: 1, constant: 0)
        
        headerView.addConstraints([leftConstraint, yCenterConstraint])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 67
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        // Get the recipes for the section requested
        let sectionName = sections[indexPath.section]
        
        let recipes = recipeDictionary[sectionName]
        
        if recipes != nil {
            // Set the recipes for the cell
            cell.showRecipes(recipes!)
        }
        
        return cell
    }
    
}
