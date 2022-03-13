//
//  NewsTableViewCell.swift
//  Crypt-IOS-Test
//
//  Created by Yujia on 2022/3/13.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsContent: UITextView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
