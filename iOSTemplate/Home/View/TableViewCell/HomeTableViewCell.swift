//
//  HomeTableViewCell.swift
//  iOSTemplate
//
//  Created by Phillip MacBook Pro on 31/07/24.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setData(food: HomeResponse) {
        self.labelView?.text = food.strCategory
        self.thumbImageView?.sd_setImage(with: URL(string: food.strCategoryThumb ?? ""))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
