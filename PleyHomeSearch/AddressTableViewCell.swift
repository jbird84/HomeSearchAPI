//
//  AddressTableViewCell.swift
//  PleyHomeSearch
//
//  Created by Kinney Kare on 4/29/22.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
