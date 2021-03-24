//
//  FetchDataViewController.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 11/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class FetchMusicDataViewController: UIViewController {

    @IBAction func fetchMusic(_ sender: Any) {
        APIManager.shared.fetchData(url: Constant.baseURL, header: nil, method: "GET"){[weak self] data, error in
            
            let decoder = JSONDecoder()
            guard let data = data else {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let musicList = try decoder.decode(MusicList.self, from: data)
                self!.passDataToMusicListViewController(musicList: musicList)
                
            }catch let err{
                print(err)
            }
            
        }
    }
    
    func passDataToMusicListViewController(musicList: MusicList) {
        DispatchQueue.main.async {[weak self] in
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
