//
//  WeeklyTableViewController.swift
//  viewPratice
//
//  Created by Jube on 2022/12/22.
//

import UIKit

class WeeklyTableViewController: UITableViewController {
    
    var songs = [
        Song(name: "孤勇者", singer: "陳奕迅", imageName: "image1", isLike: false),
        Song(name: "如果可以", singer: "韋禮安", imageName: "image2", isLike: false),
        Song(name: "從前說", singer: "小阿七", imageName: "image3", isLike: false),
        Song(name: "我很好騙", singer: "動力火車", imageName: "image4", isLike: false),
        Song(name: "嘉賓", singer: "張遠", imageName: "image5", isLike: false),
        Song(name: "慢冷", singer: "梁靜茹", imageName: "image6", isLike: false),
        Song(name: "飛鳥和蟬", singer: "任然", imageName: "image7", isLike: false),
        Song(name: "與我無關", singer: "阿冗", imageName: "image8", isLike: false),
        Song(name: "Letting Go", singer: "蔡健雅", imageName: "image9", isLike: false),
        Song(name: "擱淺", singer: "周杰倫", imageName: "image10", isLike: false),
        Song(name: "孤勇者2", singer: "陳奕迅", imageName: "image1", isLike: false),
        Song(name: "如果可以2", singer: "韋禮安", imageName: "image2", isLike: false),
        Song(name: "從前說2", singer: "小阿七", imageName: "image3", isLike: false),
        Song(name: "我很好騙2", singer: "動力火車", imageName: "image4", isLike: false),
        Song(name: "嘉賓2", singer: "張遠", imageName: "image5", isLike: false),
        Song(name: "慢冷2", singer: "梁靜茹", imageName: "image6", isLike: false),
        Song(name: "飛鳥和蟬2", singer: "任然", imageName: "image7", isLike: false),
        Song(name: "與我無關2", singer: "阿冗", imageName: "image8", isLike: false),
        Song(name: "Letting Go2", singer: "蔡健雅", imageName: "image9", isLike: false),
        Song(name: "擱淺2", singer: "周杰倫", imageName: "image10", isLike: false),
        Song(name: "孤勇者3", singer: "陳奕迅", imageName: "image1", isLike: false),
        Song(name: "如果可以3", singer: "韋禮安", imageName: "image2", isLike: false),
        Song(name: "從前說3", singer: "小阿七", imageName: "image3", isLike: false)
    ]
    var selectNum = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

   
    @IBSegueAction func show(_ coder: NSCoder) -> DetailViewController? {
        guard let row = tableView.indexPathForSelectedRow?.row else { return nil }
        selectNum = row
        return DetailViewController(coder: coder, song: songs[row], songs: songs, selectNum: selectNum)
    }
    
    
    @IBAction func preeLike(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            songs[indexPath.row].isLike = !songs[indexPath.row].isLike
            sender.setImage(UIImage(named: songs[indexPath.row].likeBtnImageName), for: .normal)
        }
    }
    
//    func configCell(_ cell: WeeklyTableViewCell, forSongAt indexPath: IndexPath){
//        cell.songName.text = songs[indexPath.row].name
//        cell.singer.text = songs[indexPath.row].singer
//        cell.albumImage.image = UIImage(named: songs[indexPath.row].imageName)
//        cell.likeBtn.imageView?.image = UIImage(named: songs[indexPath.row].likeBtnImageName)
//    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(WeeklyTableViewCell.reuseIdentifier)", for: indexPath) as? WeeklyTableViewCell else {fatalError("WeeklyTableViewCell faild")}
        let song = songs[indexPath.row]
        cell.update(with: song)
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
