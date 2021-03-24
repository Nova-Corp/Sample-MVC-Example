//
//  MusicDetailsViewController.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 10/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MusicDetailsViewController: UIViewController {
    @IBOutlet var musicAlbumImageView: UIImageView!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var trackTypeLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var collectionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var discountLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    @IBOutlet var readMoreLabel: UILabel!

    var readMoreTapped = true

    var musicDetails: MusicResult!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapDescriptionLabel))
        descriptionLabel.isUserInteractionEnabled = true
        descriptionLabel.addGestureRecognizer(tapGestureRecognizer)

        configureDetails(musicDetails: musicDetails)
    }

    @IBAction func playNowButton(_ sender: UIButton) {
        print("Play now button tapped.")
    }

    @IBAction func addToQueueButton(_ sender: UIButton) {
        print("Add to queue button tapped.")
    }

    //        MARK: - Tap Read More Label

    @objc func didTapDescriptionLabel() {
        if readMoreTapped {
            descriptionLabel.numberOfLines = 0
            readMoreTapped = false
            readMoreLabel.isHidden = true
        } else {
            descriptionLabel.numberOfLines = 5
            readMoreTapped = true
            readMoreLabel.isHidden = false
        }
    }

    //        MARK: - Configure MusicDetailsViewController Items

    private func configureDetails(musicDetails: MusicResult) {
        musicAlbumImageView.downloaded(from: musicDetails.artworkUrl100 ?? Constant.defaultThumbImage)
        trackNameLabel.attributedText = makeAttributedString(title: "Track Name: ", body: musicDetails.trackName!)
        trackTypeLabel.attributedText = makeAttributedString(title: "Type: ", body: musicDetails.wrapperType!.rawValue)
        artistNameLabel.attributedText = makeAttributedString(title: "Artist Name: ", body: musicDetails.artistName!)
        collectionLabel.attributedText = makeAttributedString(title: "Collection: ", body: musicDetails.collectionName ?? "Not found")
        priceLabel.attributedText = makeAttributedString(title: "Price: ", body: "\(musicDetails.trackPrice ?? 0) \(musicDetails.currency?.rawValue ?? Currency.usd.rawValue)")
        discountLabel.attributedText = makeAttributedString(title: "Discount: ", body: "\(musicDetails.discCount ?? 0)")
        descriptionLabel.attributedText = makeAttributedString(title: "Description: ", body: musicDetails.longDescription ?? musicDetails.shortDescription!)

        //        MARK: - Validating lines in label

        if descriptionLabel.frame.height < 42 {
            readMoreLabel.isHidden = true
        } else {
            readMoreLabel.isHidden = false
        }
    }

    //        MARK: - Attributed String for Details

    func makeAttributedString(title: String, body: String) -> NSMutableAttributedString {
        let string = title + " " + body
        let titleRange = NSRange(location: 0, length: title.count)
        let bodyRange = NSRange(location: title.count + 1, length: body.count)

        //        MARK: - Attribute for Title

        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: titleRange)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 18, weight: .semibold), range: bodyRange)

        //        MARK: - Attribute for Body

        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: bodyRange)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14, weight: .medium), range: bodyRange)

        return attributedString
    }
}
