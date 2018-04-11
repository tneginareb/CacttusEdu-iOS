
//
//  DBViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 4/11/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit
import CoreData

class DBViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addPlace(){
        let prPlace = Place.init(id: 1, name: "Prishtina")
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Places", in: context)
        let newPost = NSManagedObject.init(entity: entity!, insertInto: context)
        
        newPost.setValue(prPlace.id, forKey: "id")
        newPost.setValue(prPlace.name, forKey: "name")
        
        do{
            try context.save()
        } catch{
            print("fail to save")
        }
    }
    
    private func readPlaces(){
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        request.returnsObjectsAsFaults = false
        //request.predicate = NSPredicate.init(format: "id = %@", "1")
        
        do {
            
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                
                let id = data.value(forKey: "id") as! Int
                let name = data.value(forKey: "name") as! String
                
                let place = Place.init(id: id, name: name)
                
                let text = nameLabel.text
                nameLabel.text = text!+"\nQyteti i eshte: \(place.name)"
                
                print("id: \(place.id)")
            }
            
        }catch {
            print("could not read data..")
            
        }
        
    }
    
    @IBAction func readPressed(_ sender: UIButton) {
        readPlaces()
    }
    
    @IBAction func writePressed(_ sender: UIButton) {
        addPlace()
    }
    
}
