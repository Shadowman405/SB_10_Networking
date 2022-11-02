//
//  CourseTableViewCell.swift
//  SB_10_Networking
//
//  Created by Maxim Mitin on 2.11.22.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseNameLbl: UILabel!
    @IBOutlet weak var lessonLbl: UILabel!
    @IBOutlet weak var testsLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
