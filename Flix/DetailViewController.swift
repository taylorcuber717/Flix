//
//  DetailViewController.swift
//  Flix
//
//  Created by Taylor McLaughlin on 9/17/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import AlamofireImage

enum MovieKeys {
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var backDropImageView: UIImageView!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    var movie: Movie?
    
    @IBAction func onTap(sender: UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "GetTrailer", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        posterImageView.isUserInteractionEnabled = true
        
        
        titleLabel.text = movie!.title
        releaseDateLabel.text = movie!.releaseDateLabel
        overviewLabel.text = movie!.overview
        let backdropURL = movie!.backdropURL
        backDropImageView.af_setImage(withURL: backdropURL!)
        let posterPathURL = movie!.posterUrl
        posterImageView.af_setImage(withURL: posterPathURL!)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trailerViewController = segue.destination as! TrailerViewController
        trailerViewController.movie = movie
        
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
