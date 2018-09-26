//
//  TrailerViewController.swift
//  Flix
//
//  Created by Taylor McLaughlin on 9/19/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import AVFoundation

class TrailerViewController: UIViewController {
    
    var movie: [String: Any]?
    var trailers: [[String: Any]]?
    
    @IBOutlet var trailerWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTrailers()

        // Do any additional setup after loading the view.
    }
    
    func fetchTrailers() {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movie!["id"]!)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let trailers = dataDictionary["results"] as! [[String: Any]]
                self.trailers = trailers
                let trailer = self.trailers![0]
                let trailerURLString = "https://www.youtube.com/watch?v=\(trailer["key"]!)"
                if let trailerURL = URL(string: trailerURLString) {
                    let trailerRequest = URLRequest(url: trailerURL)
                    self.trailerWebView.loadRequest(trailerRequest)
                }
                  
                
                
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
