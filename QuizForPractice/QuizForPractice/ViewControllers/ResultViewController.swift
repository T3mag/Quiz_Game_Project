import UIKit

class ResultViewController : UIViewController {
    
    var quizName: QuizType = QuizType.filmQuiz
    var countQuestions: Int = 0
    var countCorrectAnswer: Int = 0
    var result: Int = 0
    
    @IBOutlet weak var quizNameLabel: UILabel!
    @IBOutlet weak var backgroundTopImage: UIImageView!
    @IBOutlet weak var backgroundBottomImage: UIImageView!
    @IBOutlet weak var motivationLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var countQuestionsLabel: UILabel!
    @IBOutlet weak var countCorrectAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundBottomImage.layer.cornerRadius = 25
        quizNameLabel.text = quizName.rawValue
        
        switch quizName {
        case .filmQuiz:
            backgroundTopImage.backgroundColor = .systemRed
        case .spaceQuiz:
            backgroundTopImage.backgroundColor = .systemIndigo
        case .musicQuiz:
            backgroundTopImage.backgroundColor = .systemPink
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem (
            title: "",
            style: .plain,
            target: self, action: nil
        )
        countQuestionsLabel.text = "\(countQuestions)"
        countCorrectAnswerLabel.text = "\(countCorrectAnswer)"
        calculateResult()
    }
    
    func calculateResult() {
        result = (countCorrectAnswer * 100) / countQuestions
        
        if result < 56 {
            gradeLabel.text = "2"
            gradeLabel.textColor = .red
            motivationLabel.text = "Я ожидал от тебя лучшего"
        }
        if result >= 56 && result <= 70 {
            gradeLabel.text = "3"
            gradeLabel.textColor = .yellow
            motivationLabel.text = "Ты можешь лучше!"
        }
        if result >= 71 && result <= 84 {
            gradeLabel.text = "4"
            gradeLabel.textColor = UIColor(named: "GradeColorFour")
            motivationLabel.text = "А иы не так уж и плох"
        }
        if result >= 85 {
            gradeLabel.text = "5"
            gradeLabel.textColor = .green
            motivationLabel.text = "JUST DO IT"
        }
    }
    
    @IBAction func backToQuizMenuButton(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popToRootViewController(animated: true)
        }
    }
}
