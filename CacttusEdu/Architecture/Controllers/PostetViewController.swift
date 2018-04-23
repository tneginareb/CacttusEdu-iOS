//
//  PostetViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 4/23/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

class PostetViewController: UIViewController {
    
    lazy var postet: [Post] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        callGetPostetService()
        
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //BaseURL: http://appsix.net/paintbook/index.php?
    //2 Parametra: GetPostet=&UserID=2
    private func callGetPostetService(){
        
        var urlComp = URLComponents.init(string: "https://appsix.net/paintbook/index.php")!
        
        let params = [URLQueryItem.init(name: "GetPostet", value: ""),
                      URLQueryItem.init(name: "UserID", value: "2")]
        urlComp.queryItems = params
        
        var request = URLRequest.init(url: urlComp.url!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            print("Data: \(data)")
            
            do{
                guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                    else{
                        print("error: not a valid http response")
                        return
                }
                //lazy var qytetet: [Qytet] = []
                
                if httpResponse.statusCode == 200 {
                    //success
                    let json = try JSONSerialization.jsonObject(with: receivedData)
                        as! Dictionary<String , AnyObject>
                    self.parseData(json)
                    self.onSuccessResponse()
                }else{
                    //fail
                }
                
                
            }catch{
                print("No JSON Format!")
            }
        }
        task.resume()
    }
 
    private func onSuccessResponse(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func parseData(_ json: Dictionary<String , AnyObject>){
        let jsonArray: [[String : AnyObject]] = json["postet"] as! [[String : AnyObject]]
        for jsonObject in jsonArray{
            let post = Post.init(jsonObject: jsonObject)
            self.postet.append(post)
        }
    }
}

extension PostetViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let post = self.postet[indexPath.row]
        let titleLabel = cell.viewWithTag(10) as! UILabel
        
        titleLabel.text = post.pershkrimi
        return cell
    }
}
