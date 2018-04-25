//
//  PostetPodExampleViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 4/25/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
class PostetPodExampleViewController: UIViewController {

    lazy var postet: [Post] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchPostetData()
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchPostetData(){
        var urlComp = URLComponents.init(string: "https://appsix.net/paintbook/index.php")!
        
        let params = [URLQueryItem.init(name: "GetPostet", value: ""),
                      URLQueryItem.init(name: "UserID", value: "2")]
        urlComp.queryItems = params
    
        Alamofire.request(urlComp.url!, method: .get).validate().responseJSON { response in
            switch response.result{
            case .success(let value):
                
                let json = JSON.init(value)
                if let jsonArray = json["postet"].array{
                    self.onSuccessResponse(jsonArray)
                }
                break
            case .failure(let error): break
            }
        }
    }
    
    private func onSuccessResponse(_ jsonArray: [JSON]){
        for jsonObject in jsonArray{
            let post = Post.init(withSwiftyJSONObject: jsonObject)
            postet.append(post)
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension PostetPodExampleViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let post: Post = self.postet[indexPath.row]
        let title: UILabel = cell.viewWithTag(10) as! UILabel
        let imageView: UIImageView = cell.viewWithTag(20) as! UIImageView
        
        title.text = post.pershkrimi
        let url = URL.init(string: post.photo_url)
        imageView.kf.setImage(with: url)
        return cell
    }
    
}
