
import UIKit

enum QuizType: String {
    case filmQuiz = "Киновикторина"
    case spaceQuiz = "Космовикторина"
    case musicQuiz = "Музыкальная викторина"
}

class QuizViewController: UIViewController {
    
    var quizType: QuizType = QuizType.filmQuiz
    var questions: [Quiz] = []
    var numberOfQuestion: Int = 0
    var countCorectQuestion: Int = 0
    var timer = Timer()
    var time = 30 {
        didSet {
            timerLabel.text = "\(time)"
        }
    }
    
    @IBOutlet weak var themQuizLabel: UILabel!
    @IBOutlet weak var backgroundImage1: UIImageView!
    @IBOutlet weak var backgorundImage2: UIImageView!
    @IBOutlet weak var textQuestionsLabel: UILabel!
    @IBOutlet weak var numberOfQuestionLabel: UILabel!
    @IBOutlet weak var answer1Label: UILabel!
    @IBOutlet weak var answer2Label: UILabel!
    @IBOutlet weak var answer3Label: UILabel!
    @IBOutlet weak var answer4Label: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgorundImage2.layer.cornerRadius = 25
        themQuizLabel.text = quizType.rawValue
        numberOfQuestion = 0
        countCorectQuestion = 0
        
        switch quizType {
        case .filmQuiz:
            backgroundImage1.backgroundColor = .systemRed
        case .spaceQuiz:
            backgroundImage1.backgroundColor = .systemIndigo
        case .musicQuiz:
            backgroundImage1.backgroundColor = .systemPink
        }
        
        numberOfQuestionLabel.text = "Вопрос №\(numberOfQuestion + 1)"
        textQuestionsLabel.text = questions[numberOfQuestion].question
        answer1Label.text = questions[numberOfQuestion].answer1
        answer2Label.text = questions[numberOfQuestion].answer2
        answer3Label.text = questions[numberOfQuestion].answer3
        answer4Label.text = questions[numberOfQuestion].answer4
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeСhange), userInfo: nil, repeats: true)
    }
    
    @IBAction func tapOnAnswer1(_ sender: UIButton) {
        guard numberOfQuestion <= questions.count - 1 else {
            finishQuiz()
            return
        }
        
        if (answer1Label.text == questions[numberOfQuestion].correctAnswer) {
            countCorectQuestion += 1
        }
        updateData()
    }
    
    @IBAction func tapOnAnswer2(_ sender: UIButton) {
        guard numberOfQuestion <= questions.count - 1 else {
            finishQuiz()
            return
        }
        
        if (answer2Label.text == questions[numberOfQuestion].correctAnswer) {
            countCorectQuestion += 1
        }
        updateData()
    }
    
    @IBAction func tapOnAnswer3(_ sender: UIButton) {
        guard numberOfQuestion <= questions.count - 1 else {
            finishQuiz()
            return
        }
        
        if (answer3Label.text == questions[numberOfQuestion].correctAnswer) {
            countCorectQuestion += 1
        }
        updateData()
    }
    
    @IBAction func tapOnAnswer4(_ sender: UIButton) {
        guard numberOfQuestion <= questions.count - 1 else {
            finishQuiz()
            return
        }
        
        if (answer4Label.text == questions[numberOfQuestion].correctAnswer) {
            countCorectQuestion += 1
        }
        updateData()
    }
    
    private func updateData() {
        numberOfQuestion += 1
        
        if (numberOfQuestion <= questions.count - 1) {
            numberOfQuestionLabel.text = "Вопрос №\(numberOfQuestion + 1)"
            textQuestionsLabel.text = questions[numberOfQuestion].question
            answer1Label.text = questions[numberOfQuestion].answer1
            answer2Label.text = questions[numberOfQuestion].answer2
            answer3Label.text = questions[numberOfQuestion].answer3
            answer4Label.text = questions[numberOfQuestion].answer4
            timer.invalidate()
            time = 30
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeСhange),
                                         userInfo: nil, repeats: true)
        }
        else {
            finishQuiz()
        }
    }
    
    @objc func timeСhange() {
        time -= 1
        
        if time == 0 {
            time = 30
            updateData()
            timer.invalidate()
            
            if (numberOfQuestion > questions.count - 1) {
                finishQuiz()
            }
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeСhange),
                                         userInfo: nil, repeats: true)
        }
    }
    
    func finishQuiz() {
        timer.invalidate()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              guard let resultViewController = storyboard.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else { return }
        resultViewController.quizName = quizType
        resultViewController.countQuestions = questions.count
        resultViewController.countCorrectAnswer = countCorectQuestion
        
        navigationController?.pushViewController(resultViewController, animated: true)
    }
}
