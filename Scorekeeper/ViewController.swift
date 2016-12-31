//
//  ViewController.swift
//  Scorekeeper
//
//  Created by Nate Thompson on 12/30/16.
//  Copyright © 2016 Nate Thompson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var scores = ["Cal" : 1, "Brian" : 6, "Nort" : 124, "Sam" : 62, "K8" : 4, "Ringo" : 97, "Rick" : 16, "Schroeder" : 0]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "score", for: indexPath) as! ScoreCell
        
        let row = indexPath.row
        let name = Array(scores.keys)[row]
        cell.decorate(for: name, in: self)
        
        return cell
    }

}

class ScoreCell : UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func subtractPressed(_ sender: AnyObject) {
        self.updateScore(offset: -1)
    }
    
    @IBAction func addPressed(_ sender: AnyObject) {
        self.updateScore(offset: 1)
    }
    
    var name: String!
    var controller: ViewController!
    
    func decorate(for name: String, in controller: ViewController) {
        let score = controller.scores[name] ?? 0
        self.label.text = "\(name): \(score)"
        
        self.name = name
        self.controller = controller
    }
    
    func updateScore(offset: Int) {
        var score = controller.scores[name] ?? 0
        score += offset
        controller.scores[name] = score
        
        self.label.text = "\(name ?? "Unnamed Person"): \(score)"
    }
    
}
