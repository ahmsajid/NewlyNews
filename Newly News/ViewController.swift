//
//  ViewController.swift
//  Newly News
//
//  Created by A H M Masfiqur Rahman Sajid on 5/1/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //array containing all articles
    var articles: [Article]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArticles()
    }
    
    //MARK: Fetching articles using url Request
    func fetchArticles() {
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=daily-mail&sortBy=latest&apiKey=565dee2e9ea84106b8c3069906e1d30f")!)
        
        //Creating task that is going to download everything in the url, this URLSession is going to give 3 things, data, response, error
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            //Create the object right here by creating empty article array.
            self.articles = [Article]()
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJSON = json["articles"] as? [[String : AnyObject]] {
                    
                    //Extracting each articles we need
                    for articleFromJSON in articlesFromJSON {
                        //Creating an article object that is going to save articles
                        let article = Article()
                        
                        //extracting values all at once
                        if let title = articleFromJSON["title"] as? String, let author = articleFromJSON["author"] as? String, let articledescription = articleFromJSON["description"] as? String, let url = articleFromJSON["url"] as? String, let urlToImage = articleFromJSON["urlToImage"] as? String {
                            
                            article.author = author
                            article.articleDescription = articledescription
                            article.headlineTitle = title
                            article.url = url
                            article.urlImage = urlToImage
                        }
                            self.articles?.append(article)
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    //MARK: TableView Delegates and Datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCellTableViewCell
        //For every article we are putting one cell
        cell.articleTitle.text = self.articles?[indexPath.item].headlineTitle
        cell.articleDescription.text = self.articles?[indexPath.item].articleDescription
        cell.author.text = self.articles?[indexPath.item].author
        cell.articleImgView.downloadImage(from: (self.articles?[indexPath.item].urlImage!)!)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension UIImageView {
    func downloadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
    
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}















