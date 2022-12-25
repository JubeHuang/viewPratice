//
//  WeeklyTableViewCell.swift
//  viewPratice
//
//  Created by Jube on 2022/12/22.
//

import UIKit

class WeeklyTableViewCell: UITableViewCell {

    @IBOutlet weak var singer: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with song: Song) {
        songName.text = song.name
        singer.text = song.singer
        albumImage.image = UIImage(named: song.imageName)
        likeBtn.imageView?.image = UIImage(named: song.likeBtnImageName)
    }

}
