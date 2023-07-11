
import UIKit

class StartGameViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.layer.cornerRadius = 25
        backgroundImageView.backgroundColor = .systemMint
    }
    
    @IBAction func startGameButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SelectionGameViewController")
            else {return}
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

