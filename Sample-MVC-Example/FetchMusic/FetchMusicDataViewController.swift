//
//  FetchDataViewController.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 11/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class FetchMusicDataViewController: UIViewController {
    //        MARK: - Make API Request for Fetch Music List

    @IBAction func fetchMusic(_ sender: Any) {
        APIManager.shared.fetchData(url: Constant.baseURL, header: nil, method: "GET") { [weak self] data, response, error  in
            
            do {
                let decoder = JSONDecoder()
                guard let data = data else { throw error! }

                let musicList = try decoder.decode(MusicList.self, from: data)
                self!.passDataToMusicListViewController(musicList: musicList)

            } catch let err {
                DispatchQueue.main.async { [weak self] in
                    self?.presentAlert(with: err.localizedDescription)
                }
            }
        }
    }

    //        MARK: - Pass Data To MusicListViewController

    func passDataToMusicListViewController(musicList: MusicList) {
        DispatchQueue.main.async { [weak self] in
            if let musicResult = musicList.results,
                let musicListViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "MusicListViewController")
                as? MusicListViewController {
                musicListViewController.musicList = musicResult

                self?.navigationController?.pushViewController(musicListViewController, animated: true)
            }
        }
    }
}
