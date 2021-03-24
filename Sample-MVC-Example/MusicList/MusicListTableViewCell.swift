//
//  MusicListTableViewCell.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 10/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MusicListTableViewCell: UITableViewCell {
    static let identifier = "MusicListTableViewCell"
    @IBOutlet var musicImageView: UIImageView!
    @IBOutlet var musicTitleLabel: UILabel!
    @IBOutlet var musicSubTitleLabel: UILabel!

    //        MARK: - Configure MusicListTableViewCell Items

    func configureMusicCell(music: MusicResult) {
        musicImageView.downloaded(from: music.artworkUrl30 ?? Constant.defaultThumbImage, contentMode: .scaleAspectFill)
        musicTitleLabel.text = music.trackName
        musicSubTitleLabel.text = music.artistName
    }
}
