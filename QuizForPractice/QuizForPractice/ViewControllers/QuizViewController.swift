
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
    var questionResponseTime = 30 {
        didSet {
            timerLabel.text = "\(questionResponseTime)"
        }
    }
    
    @IBOutlet weak var nameQuizLabel: UILabel!
    @IBOutlet weak var backgroundTopImage: UIImageView!
    @IBOutlet weak var backgorundBottomImage: UIImageView!
    @IBOutlet weak var textQuestionsLabel: UILabel!
    @IBOutlet weak var numberOfQuestionLabel: UILabel!
    @IBOutlet weak var answer1ButtonLabel: UILabel!
    @IBOutlet weak var answer2ButtonLabel: UILabel!
    @IBOutlet weak var answer3ButtonLabel: UILabel!
    @IBOutlet weak var answer4ButtonLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgorundBottomImage.layer.cornerRadius = 25
        nameQuizLabel.text = quizType.rawValue
        numberOfQuestion = 0
        countCorectQuestion = 0
        
        switch quizType {
        case .filmQuiz:
            backgroundTopImage.backgroundColor = .systemRed
        case .spaceQuiz:
            backgroundTopImage.backgroundColor = .systemIndigo
        case .musicQuiz:
            backgroundTopImage.backgroundColor = .systemPink
        }
        
        numberOfQuestionLabel.text = "Вопрос №\(numberOfQuestion + 1)"
        textQuestionsLabel.text = questions[numberOfQuestion].question
        answer1ButtonLabel.text = questions[numberOfQuestion].answer1
        answer2ButtonLabel.text = questions[numberOfQuestion].answer2
        answer3ButtonLabel.text = questions[numberOfQuestion].answer3
        answer4ButtonLabel.text = questions[numberOfQuestion].answer4
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeСhange), userInfo: nil, repeats: true)
    }
    
    @IBAction func tapOnAnswer1Button(_ sender: UIButton) {
        guard numberOfQuestion <= questions.count - 1 else {
            finishQuiz()
            return
        }
        
        if (answer1ButtonLabel.text == questions[numberOfQuestion].correctAnswer) {
            countCorectQuestion += 1
        }
        updateData()
    }
    
    @IBAction func tapOnAnswer2Button(_ sender: UIButton) {
        guard numberOfQuestion <= questions.count - 1 else {
            finishQuiz()
            return
        }
        
        if (answer2ButtonLabel.text == questions[numberOfQuestion].correctAnswer) {
            countCorectQuestion += 1
        }
        updateData()
    }
    
    @IBAction func tapOnAnswer3Button(_ sender: UIButton) {
        guard numberOfQuestion <= questions.count - 1 else {
            finishQuiz()
            return
        }
        
        if (answer3ButtonLabel.text == questions[numberOfQuestion].correctAnswer) {
            countCorectQuestion += 1
        }
        updateData()
    }
    
    @IBAction func tapOnAnswer4Button(_ sender: UIButton) {
        guard numberOfQuestion <= questions.count - 1 else {
            finishQuiz()
            return
        }
        
        if (answer4ButtonLabel.text == questions[numberOfQuestion].correctAnswer) {
            countCorectQuestion += 1
        }
        updateData()
    }
    
    private func updateData() {
        numberOfQuestion += 1
        
        if (numberOfQuestion <= questions.count - 1) {
            numberOfQuestionLabel.text = "Вопрос №\(numberOfQuestion + 1)"
            textQuestionsLabel.text = questions[numberOfQuestion].question
            answer1ButtonLabel.text = questions[numberOfQuestion].answer1
            answer2ButtonLabel.text = questions[numberOfQuestion].answer2
            answer3ButtonLabel.text = questions[numberOfQuestion].answer3
            answer4ButtonLabel.text = questions[numberOfQuestion].answer4
            timer.invalidate()
            questionResponseTime = 30
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeСhange),
                                         userInfo: nil, repeats: true)
        }
        else {
            finishQuiz()
        }
    }
    
    @objc func timeСhange() {
        questionResponseTime -= 1
        
        if questionResponseTime == 0 {
            questionResponseTime = 30
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
