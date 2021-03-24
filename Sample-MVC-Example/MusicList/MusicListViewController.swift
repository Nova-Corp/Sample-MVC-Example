//
//  MusicListViewController.swift
//  Sample-MVC-Example
//
//  Created by ADMIN on 24/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class MusicListViewController: UITableViewController {
    var musicList: [MusicResult]!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musicList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListTableViewCell") as! MusicListTableViewCell
        cell.configureMusicCell(music: musicList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let musicListViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MusicDetailsViewController")
            as? MusicDetailsViewController {
            let musicResult = musicList[indexPath.row]
            musicListViewController.musicDetails = musicResult
            self.navigationController?.pushViewController(musicListViewController, animated: true)
        }
    }
}

