//
//  MovieCell.swift
//  
//
//  Created by Taylor McLaughlin on 9/12/18.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
