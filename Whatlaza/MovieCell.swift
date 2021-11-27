//
//  MovieCell.swift
//  Whatlaza
//
//  Created by Astronaut Elvis on 11/26/21.
//

import UIKit

class MovieCell: UITableViewCell {
    // 1. Add outlets to views
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
