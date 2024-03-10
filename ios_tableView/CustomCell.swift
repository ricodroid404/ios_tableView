//
//  CustomCell.swift
//  ios_tableView
//
//  Created by riko on 2024/03/10.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var sampleImageView: UIImageView!
    
    @IBOutlet weak var sampleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
