//
//  DetailViewController.swift
//  viewPratice
//
//  Created by Jube on 2022/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    let song: Song
    var songs: [Song]
    let selectNum: Int
    
    init?(coder: NSCoder, song: Song, songs: [Song], selectNum: Int) {
        self.song = song
        self.songs = songs
        self.selectNum = selectNum
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var pagination: UIPageControl!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songLabel.text = song.name
        singerLabel.text = song.singer
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

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DetailCollectionViewCell.self)", for: indexPath) as? DetailCollectionViewCell else {
            fatalError("DetailCollectionViewCell faild")
        }
        let newIndexPath = (selectNum + indexPath.row) % songs.count
        cell.detailAlbumImage.image = UIImage(named: songs[newIndexPath].imageName)
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.bounds.width
        pagination.currentPage = Int(pageNumber)
        let newNum = (selectNum + Int(pageNumber)) % songs.count
        songLabel.text = songs[newNum].name
        singerLabel.text = songs[newNum].singer
    }
}

//讓paging尺寸符合需求
//extension DetailViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        collectionView.bounds.size
//    }
//}
