
import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func Mybuttons(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (Status) in
            if Status == .authorized {
                DispatchQueue.main.async {
                    self.playeGenre(genre: sender.currentTitle!)
                }
               
            }
        }
        
    }
    @IBAction func myButton(_ sender: Any) {
    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
   func playeGenre (genre: String) {
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate (value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    

   

}
