//
//  SearchViewController.swift
//  viewPratice
//
//  Created by Jube on 2022/12/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    let genres = [
        Genres(type: "2022年度總回顧", imageName: "image1", color: UIColor(rgb: 0x8400E7)),
        Genres(type: "Podcast", imageName: "image2", color: UIColor(rgb: 0xE13300)),
        Genres(type: "專為你打造", imageName: "image3", color: UIColor(rgb: 0x1E3264)),
        Genres(type: "最新發行", imageName: "image4", color: UIColor(rgb: 0xE8115B)),
        Genres(type: "華語流行", imageName: "image5", color: UIColor(rgb: 0x537AA1)),
        Genres(type: "流行樂", imageName: "image6", color: UIColor(rgb: 0x148A08)),
        Genres(type: "嘻哈樂", imageName: "image7", color: UIColor(rgb: 0xBC5900)),
        Genres(type: "排行榜", imageName: "image8", color: UIColor(rgb: 0x8D67AB)),
        Genres(type: "現場活動", imageName: "image9", color: UIColor(rgb: 0x5A69BB)),
        Genres(type: "韓語流行樂", imageName: "image10", color: UIColor(rgb: 0x7358FF)),
        Genres(type: "台灣流行歌曲", imageName: "image1", color: UIColor(rgb: 0x2300E7)),
        Genres(type: "Special", imageName: "image2", color: UIColor(rgb: 0xF19900)),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SearchCollectionViewCell.self)", for: indexPath) as? SearchCollectionViewCell else { fatalError("SearchCollectionViewCell faild") }
        cell.updatUI(genre: genres[indexPath.row])
        return cell
    }
}
