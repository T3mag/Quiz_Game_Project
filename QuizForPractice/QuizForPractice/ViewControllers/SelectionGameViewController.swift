
import UIKit

class SelectionGameViewController: UIViewController {
    
    @IBOutlet weak var kinoQuizImage: UIImageView!
    @IBOutlet weak var spaceQuizImage: UIImageView!
    @IBOutlet weak var musicQuizImage: UIImageView!
    @IBOutlet weak var buttonKinoQuiz: UIButton!
    @IBOutlet weak var buttonsapceQuiz: UIButton!
    @IBOutlet weak var buttonMusicQuiz: UIButton!
    @IBOutlet weak var countKinoQuizQuestions: UILabel!
    @IBOutlet weak var countMusicQuizQuestion: UILabel!
    @IBOutlet weak var counSpaceQuizQuestion: UILabel!
   
    private var kinoQuiz: [Quiz] = [
        Quiz(question: "Кто сыграл роль Гарри Поттера в фильмах о волшебнике?", answer1: "Daniel Radcliffe", answer2: "Rupert Grint", answer3: "Emma Watson", answer4: "Tom Felton", correctAnswer: "Daniel Radcliffe"),
        Quiz(question: "В какой стране был снят фильм 'Титаник'?", answer1: "Франция", answer2: "Италия", answer3: "США", answer4: "Великобритания", correctAnswer: "США"),
        Quiz(question: "Кто сыграл главную роль в фильме 'Властелин колец: Возвращение короля'?", answer1: "Orlando Bloom", answer2: "Elijah Wood", answer3: "Viggo Mortensen", answer4: "Sean Astin", correctAnswer: "Elijah Wood"),
        Quiz(question: "Как называется главный герой серии фильмов о Джеймсе Бонде?", answer1: "Daniel Craig", answer2: "Pierce Brosnan", answer3: "Roger Moore", answer4: "Sean Connery", correctAnswer: "James Bond"),
        Quiz(question: "Кто сыграл роль Белль в фильме 'Красавица и Чудовище' (2017)?", answer1: "Emma Watson", answer2: "Lily James", answer3: "Daisy Ridley", answer4: "Keira Knightley", correctAnswer: "Emma Watson"),
        Quiz(question: "Как называется самый кассовый фильм в истории кино?", answer1: "Аватар", answer2: "Мстители: Финал", answer3: "Крепкий орешек 4.0", answer4: "Человек-паук: Вдали от дома", correctAnswer: "Аватар"),
        Quiz(question: "Кто сыграл роль Халка в серии фильмов о Мстителях?", answer1: "Chris Evans", answer2: "Mark Ruffalo", answer3: "Robert Downey Jr.", answer4: "Chris Hemsworth", correctAnswer: "Mark Ruffalo"),
        Quiz(question: "Как называется первый фильм серии 'Форсаж'?", answer1: "Форсаж 2", answer2: "Форсаж 3: Токийский дрифт", answer3: "Форсаж 4", answer4: "Форсаж", correctAnswer: "Форсаж"),
        Quiz(question: "Кто сыграл главную роль в фильме 'Зеленая миля'?", answer1: "Tom Hanks", answer2: "Morgan Freeman", answer3: "Brad Pitt", answer4: "Leonardo DiCaprio", correctAnswer: "Tom Hanks"),
        Quiz(question: "Как называется первый фильм в серии 'Матрица'?", answer1: "Матрица: Революция", answer2: "Матрица: Перезагрузка", answer3: "Матрица: Революция", answer4: "Матрица", correctAnswer: "Матрица"),
        Quiz(question: "Кто сыграл роль Желтого Жакета в фильме 'Такси'?", answer1: "Gerard Depardieu", answer2: "Jean Reno", answer3: "Samuel L. Jackson", answer4: "Vin Diesel", correctAnswer: "Samuel L. Jackson"),
        Quiz(question: "Кто сыграл главную роль в фильме 'Крепкий орешек'?", answer1: "Sylvester Stallone", answer2: "Arnold Schwarzenegger", answer3: "Bruce Willis", answer4: "Jean-Claude Van Damme", correctAnswer: "Bruce Willis"),
        Quiz(question: "Как называется франшиза фильмов о Преступном отделе полиции Майами?", answer1: "Вышибала", answer2: "Криминальное чтиво", answer3: "Отмель", answer4: "Тутки", correctAnswer: "Отмель"),
        Quiz(question: "Кто сыграл роль Джокера в фильме 'Темный рыцарь'?", answer1: "Michael Caine", answer2: "Gary Oldman", answer3: "Christian Bale", answer4: "Heath Ledger", correctAnswer: "Heath Ledger"),
        Quiz(question: "Как называется первый фильм серии 'Бэтмен' режиссера Кристофера Нолана?", answer1: "Бэтмен: Начало", answer2: "Бэтмен: Темный рыцарь", answer3: "Бэтмен: Возвращение", answer4: "Бэтмен: Пробудись", correctAnswer: "Бэтмен: Начало"),
        Quiz(question: "Кто сыграл главную роль в фильме 'Великий Гэтсби' (2013)?", answer1: "Leonardo DiCaprio", answer2: "Brad Pitt", answer3: "Johnny Depp", answer4: "Tom Hardy", correctAnswer: "Leonardo DiCaprio"),
        Quiz(question: "Какой фильм вышел раньше: 'Титаник' или 'Звездные войны: Эпизод IV - Новая надежда'?", answer1: "Титаник", answer2: "Звездные войны: Эпизод IV - Новая надежда", answer3: "Оба одновременно", answer4: "Не знаю", correctAnswer: "Звездные войны: Эпизод IV - Новая надежда"),
        Quiz(question: "Какой актер сыграл главную роль в фильме 'Властелин колец: Братство кольца'?", answer1: "Элайджа Вуд", answer2: "Дэниел Рэдклифф", answer3: "Брэд Питт", answer4: "Киану Ривз", correctAnswer: "Элайджа Вуд"),
        Quiz(question: "Какая страна является родиной режиссера Кристофера Нолана?", answer1: "Великобритания", answer2: "Франция", answer3: "США", answer4: "Австралия", correctAnswer: "Великобритания"),
        Quiz(question: "Какой фильм получил самое большое количество Оскаров в истории?", answer1: "Титаник", answer2: "Звездные войны: Эпизод IV - Новая надежда", answer3: "Властелин колец: Возвращение короля", answer4: "Бен-Гур", correctAnswer: "Властелин колец: Возвращение короля"),
        Quiz(question: "Какая актриса сыграла главную роль в фильме 'Черная лагуна'?", answer1: "Марлон Брандо", answer2: "Мэрилин Монро", answer3: "Жан Моро", answer4: "Кэтрин Хепберн", correctAnswer: "Кэтрин Хепберн"),
        Quiz(question: "Какой фильм считается самым прибыльным в истории кино?", answer1: "Мстители: Финал", answer2: "Аватар", answer3: "Титаник", answer4: "Звездные войны: Пробуждение силы", correctAnswer: "Аватар"),
        Quiz(question: "Кто снял фильм 'Великий Гэтсби'?", answer1: "Мартин Скорсезе", answer2: "Квентин Тарантино", answer3: "Баз Лурман", answer4: "Ридли Скотт", correctAnswer: "Баз Лурман"),
        Quiz(question: "Какой актер сыграл главную роль в фильме 'Матрица'?", answer1: "Том Хэнкс", answer2: "Леонардо ДиКаприо", answer3: "Киану Ривз", answer4: "Брэд Питт", correctAnswer: "Киану Ривз"),
        Quiz(question: "Какой фильм считается лучшим всех времен по версии сайта IMDb?", answer1: "Побег из Шоушенка", answer2: "Крестный отец", answer3: "Зеленая миля", answer4: "Форрест Гамп", correctAnswer: "Побег из Шоушенка"),
        Quiz(question: "Какая актриса сыграла главную роль в фильме 'Мулен Руж'?", answer1: "Кейт Уинслет", answer2: "Натали Портман", answer3: "Хелен Миррен", answer4: "Николь Кидман", correctAnswer: "Николь Кидман"),
        Quiz(question: "Кто снял фильм 'Терминатор'?", answer1: "Роберт Земекис", answer2: "Тим Бёртон", answer3: "Джеймс Кэмерон", answer4: "Стивен Спилберг", correctAnswer: "Джеймс Кэмерон"),
        Quiz(question: "Какой фильм является самым долгим в истории?", answer1: "Аватар", answer2: "Крестный отец", answer3: "Гражданин Кейн", answer4: "Шерлок Холмс", correctAnswer: "Аватар"),
        Quiz(question: "Какой актер сыграл главную роль в фильме 'Леон: Профессионал'?", answer1: "Роберт Де Ниро", answer2: "Брюс Уиллис", answer3: "Джейсон Стейтем", answer4: "Жан Рено", correctAnswer: "Жан Рено"),
        Quiz(question: "Кто снял фильм 'Криминальное чтиво'?", answer1: "Кристофер Нолан", answer2: "Дэвид Финчер", answer3: "Мартин Скорсезе", answer4: "Квентин Тарантино", correctAnswer: "Квентин Тарантино")
    ]
    
    private var spaceQuiz: [Quiz] = [
        Quiz(question: "Какая планета Солнечной системы находится ближе всего к Солнцу?", answer1: "Венера", answer2: "Меркурий", answer3: "Земля", answer4: "Марс", correctAnswer: "Меркурий"),
        Quiz(question: "Как называется наша Галактика?", answer1: "Млечный Путь", answer2: "Андромеда", answer3: "Туманность Антарес", answer4: "Центавра А", correctAnswer: "Млечный Путь"),
        Quiz(question: "Какой спутник Земли является единственным природным спутником синхронно вращающимся вокруг Земли?", answer1: "Фобос", answer2: "Ганимед", answer3: "Луна", answer4: "Деймос", correctAnswer: "Луна"),
        Quiz(question: "Какой спутник Юпитера является самым большим в Солнечной системе?", answer1: "Ганимед", answer2: "Европа", answer3: "Ио", answer4: "Каллисто", correctAnswer: "Ганимед"),
        Quiz(question: "Какая планета Солнечной системы известна своими Кольцами?", answer1: "Сатурн", answer2: "Юпитер", answer3: "Нептун", answer4: "Плутон", correctAnswer: "Сатурн"),
        Quiz(question: "Какой планетой является карликовая планета Земли, на которую отправился первый искусственный спутник Земли?", answer1: "Плутон", answer2: "Марс", answer3: "Венера", answer4: "Земля", correctAnswer: "Луна"),
        Quiz(question: "Какое явление называется переходом планеты по диску Солнца?", answer1: "Лунное затмение", answer2: "Солнечное затмение", answer3: "Транзит", answer4: "Метеорный дождь", correctAnswer: "Транзит"),
        Quiz(question: "Какой планетой нашей Солнечной системы является газовый гигант, имеющий ветреный пояс на экваторе, кажущимся на фотографиях в виде полос?", answer1: "Уран", answer2: "Сатурн", answer3: "Юпитер", answer4: "Нептун", correctAnswer: "Юпитер"),
        Quiz(question: "Как называются остатки после взрыва звезды, в которых весь ее объем сжимается в точку нулевого объема и бесконечной плотности?", answer1: "Черные дыры", answer2: "Белые карлики", answer3: "Нейтронные звезды", answer4: "Пульсары", correctAnswer: "Черные дыры"),
        Quiz(question: "Какой космический аппарат был первым в истории отправленным человеком на орбиту Земли?", answer1: "Союз", answer2: "Восток", answer3: "Аполлон", answer4: "Юнити", correctAnswer: "Восток"),
        Quiz(question: "Какая планета находится между Землей и Ураном?", answer1: "Нептун", answer2: "Юпитер", answer3: "Марс", answer4: "Меркурий", correctAnswer: "Марс"),
        Quiz(question: "Какая планета Солнечной системы имеет наибольшее количество спутников?", answer1: "Марс", answer2: "Юпитер", answer3: "Уран", answer4: "Нептун", correctAnswer: "Юпитер"),
        Quiz(question: "Какая планета Солнечной системы является самой гористой?", answer1: "Марс", answer2: "Земля", answer3: "Венера", answer4: "Юпитер", correctAnswer: "Земля"),
        Quiz(question: "Как называется то явление, когда полное затмение Солнца сопровождается видимостью только окаймленной окружностью Солнца?", answer1: "Аннулярное затмение", answer2: "Парциальное затмение", answer3: "Кольцевое затмение", answer4: "Солнечный ветер", correctAnswer: "Аннулярное затмение"),
        Quiz(question: "Какой космический аппарат совершил первый контролируемый полет в атмосферном слое повышенной плотности и преодолел звуковой барьер?", answer1: "Спутник", answer2: "Аполлон", answer3: "Восток", answer4: "Меркурий", correctAnswer: "Восток"),
        Quiz(question: "Как называется процесс слияния ядер атомов водорода в ядро более тяжелого элемента?", answer1: "Ядерный распад", answer2: "Эйнштейниум", answer3: "1953 год", answer4: "Ядро энергетической установки СУЗ", correctAnswer: "Ядерный синтез"),
        Quiz(question: "Какой аппарат был первым в истории, сделавшим аэрокосмическую фотографию Земли из космоса?", answer1: "Восток", answer2: "Аполлон", answer3: "Союз", answer4: "Восток", correctAnswer: "Восток"),
        Quiz(question: "Как называется самый большой космический телескоп, который находится на орбите Земли?", answer1: "Хаббл", answer2: "Челленджер", answer3: "Ариэль", answer4: "Джеймс Уэбб", correctAnswer: "Хаббл"),
        Quiz(question: "Какой космический аппарат совершил первую посадку на поверхности Луны?", answer1: "Союз", answer2: "Аполлон", answer3:"Восток", answer4: "Юнити", correctAnswer: "Аполлон"),
        Quiz(question: "Сколько спутников имеет планета Земля?", answer1: "1", answer2: "2", answer3: "3", answer4: "4", correctAnswer: "1"),
        Quiz(question: "Какая планета Солнечной системы является самой большой по диаметру?", answer1: "Марс", answer2: "Уран", answer3: "Земля", answer4: "Юпитер", correctAnswer: "Юпитер"),
        Quiz(question: "Какая планета считается самой близкой к Солнцу?", answer1: "Марс", answer2: "Юпитер", answer3: "Венера", answer4: "Уран", correctAnswer: "Венера"),
        Quiz(question: "Какая планета является самой большой в Солнечной системе?", answer1: "Меркурий", answer2: "Марс", answer3: "Сатурн", answer4: "Юпитер", correctAnswer: "Юпитер"),
        Quiz(question: "Как называется спутник Земли?", answer1: "Луна", answer2: "Марс", answer3: "Венера", answer4: "Меркурий", correctAnswer: "Луна"),
        Quiz(question: "Какая планета считается самой холодной в Солнечной системе?", answer1: "Марс", answer2: "Сатурн", answer3: "Уран", answer4: "Нептун", correctAnswer: "Уран"),
        Quiz(question: "Какое самое большое космическое тело в Солнечной системе?", answer1: "Солнце", answer2: "Луна", answer3: "Земля", answer4: "Сатурн", correctAnswer: "Солнце"),
        Quiz(question: "Какая планета считается самой жаркой в Солнечной системе?", answer1: "Марс", answer2: "Меркурий", answer3: "Венера", answer4: "Уран", correctAnswer: "Венера"),
        Quiz(question: "Как называется самый большой спутник Сатурна?", answer1: "Ио", answer2: "Титан", answer3: "Ганимед", answer4: "Эвклид", correctAnswer: "Титан"),
        Quiz(question: "Какая планета является самой маленькой в Солнечной системе?", answer1: "Марс", answer2: "Меркурий", answer3: "Венера", answer4: "Уран", correctAnswer: "Меркурий"),
        Quiz(question: "Какой космический аппарат был первым, который достиг поверхности Луны?", answer1: "Аполлон-11", answer2: "Союз-11", answer3: "Восток-1", answer4: "Хаббл", correctAnswer: "Аполлон-11")
    ]
    
    private var musicQuiz: [Quiz] = [
        Quiz(question: "Кто исполняет песню 'Shape of You'?", answer1: "Ed Sheeran", answer2: "Justin Bieber", answer3: "Bruno Mars", answer4: "Taylor Swift", correctAnswer: "Ed Sheeran"),
        Quiz(question: "Какой исполнитель записал песню 'Hello'?", answer1: "Adele", answer2: "Rihanna", answer3: "Beyoncé", answer4: "Katy Perry", correctAnswer: "Adele"),
        Quiz(question: "Какой исполнитель считается королем поп-музыки?", answer1: "Michael Jackson", answer2: "Elvis Presley", answer3: "Prince", answer4: "Justin Timberlake", correctAnswer: "Michael Jackson"),
        Quiz(question: "Кто исполняет песню 'Bohemian Rhapsody'?", answer1: "Queen", answer2: "The Beatles", answer3: "Led Zeppelin", answer4: "Guns N' Roses", correctAnswer: "Queen"),
        Quiz(question: "Какой исполнитель выпустил альбом 'Thriller'?", answer1: "Michael Jackson", answer2: "David Bowie", answer3: "Stevie Wonder", answer4: "Prince", correctAnswer: "Michael Jackson"),
        Quiz(question: "Кто исполняет песню 'Despacito'?", answer1: "Luis Fonsi", answer2: "Enrique Iglesias", answer3: "Ricky Martin", answer4: "Maluma", correctAnswer: "Luis Fonsi"),
        Quiz(question: "Какая певица выступила с песней 'Rolling in the Deep'?", answer1: "Adele", answer2: "Beyoncé", answer3: "Rihanna", answer4: "Katy Perry", correctAnswer: "Adele"),
        Quiz(question: "Кто исполняет песню 'Thinking Out Loud'?", answer1: "Ed Sheeran", answer2: "Sam Smith", answer3: "John Legend", answer4: "Charlie Puth", correctAnswer: "Ed Sheeran"),
        Quiz(question: "Какая группа исполняет песню 'Hotel California'?", answer1: "Eagles", answer2: "AC/DC", answer3: "Rolling Stones", answer4: "Guns N' Roses", correctAnswer: "Eagles"),
        Quiz(question: "Кто исполняет песню 'Like a Rolling Stone'?", answer1: "Bob Dylan", answer2: "The Beatles", answer3: "Elvis Presley", answer4: "David Bowie", correctAnswer: "Bob Dylan"),
        Quiz(question: "Какой исполнитель записал песню 'Smooth'?", answer1: "Santana", answer2: "U2", answer3: "Red Hot Chili Peppers", answer4: "Coldplay", correctAnswer: "Santana"),
        Quiz(question: "Кто исполняет песню 'Wonderwall'?", answer1: "Oasis", answer2: "Nirvana", answer3: "Radiohead", answer4: "Coldplay", correctAnswer: "Oasis"),
        Quiz(question: "Какая певица выступает под псевдонимом Lady Gaga?", answer1: "Stefani Germanotta", answer2: "Katy Perry", answer3: "Beyoncé", answer4: "Rihanna", correctAnswer: "Stefani Germanotta"),
        Quiz(question: "Кто исполняет песню 'Billie Jean'?", answer1: "Michael Jackson", answer2: "Elvis Presley", answer3: "Prince", answer4: "David Bowie", correctAnswer: "Michael Jackson"),
        Quiz(question: "Какая группа исполняет песню 'Sweet Child o' Mine'?", answer1: "Guns N' Roses", answer2: "Nirvana", answer3: "Metallica", answer4: "AC/DC", correctAnswer: "Guns N' Roses"),
        Quiz(question: "Кто исполняет песню 'Hey Jude'?", answer1: "The Beatles", answer2: "Queen", answer3: "Led Zeppelin", answer4: "The Rolling Stones", correctAnswer: "The Beatles"),
        Quiz(question: "Какой исполнитель записал песню 'I Will Always Love You'?", answer1: "Whitney Houston", answer2: "Mariah Carey", answer3: "Celine Dion", answer4: "Adele", correctAnswer: "Whitney Houston"),
        Quiz(question: "Кто исполняет песню 'Sweet Home Alabama'?", answer1: "Lynyrd Skynyrd", answer2: "The Doors", answer3: "The Eagles", answer4: "Creedence Clearwater Revival", correctAnswer: "Lynyrd Skynyrd"),
        Quiz(question: "Какая певица выступила с песней 'Poker Face'?", answer1: "Lady Gaga", answer2: "Katy Perry", answer3: "Beyoncé", answer4: "Rihanna", correctAnswer: "Lady Gaga"),
        Quiz(question: "Кто исполняет песню 'Smells Like Teen Spirit'?", answer1: "Nirvana", answer2: "Metallica", answer3: "Guns N' Roses", answer4: "AC/DC", correctAnswer: "Nirvana"),
        Quiz(question: "Какой исполнитель записал песню 'Shape of My Heart'?", answer1: "Sting", answer2: "Elton John", answer3: "Phil Collins", answer4: "Bryan Adams", correctAnswer: "Sting"),
        Quiz(question: "Кто исполняет песню 'Shape of You'?", answer1: "Ed Sheeran", answer2: "Justin Bieber", answer3: "Bruno Mars", answer4: "Taylor Swift", correctAnswer: "Ed Sheeran"),
        Quiz(question: "Какой исполнитель записал песню 'Hello'?", answer1: "Adele", answer2: "Rihanna", answer3: "Beyoncé", answer4: "Katy Perry", correctAnswer: "Adele"),
        Quiz(question: "Кто исполняет песню 'Bohemian Rhapsody'?", answer1: "Queen", answer2: "The Beatles", answer3: "Led Zeppelin", answer4: "Guns N' Roses", correctAnswer: "Queen"),
        Quiz(question: "Какая певица выступила с песней 'Rolling in the Deep'?", answer1: "Adele", answer2: "Beyoncé", answer3: "Rihanna", answer4: "Katy Perry", correctAnswer: "Adele"),
        Quiz(question: "Кто исполняет песню 'Thinking Out Loud'?", answer1: "Ed Sheeran", answer2: "Sam Smith", answer3: "John Legend", answer4: "Charlie Puth", correctAnswer: "Ed Sheeran"),
        Quiz(question: "Какая группа исполняет песню 'Hotel California'?", answer1: "Eagles", answer2: "AC/DC", answer3: "Rolling Stones", answer4: "Guns N' Roses", correctAnswer: "Eagles"),
        Quiz(question: "Кто исполняет песню 'Billie Jean'?", answer1: "Michael Jackson", answer2: "Elvis Presley", answer3: "Prince", answer4: "David Bowie", correctAnswer: "Michael Jackson"),
        Quiz(question: "Какая группа исполняет песню 'Sweet Child o' Mine'?", answer1: "Guns N' Roses", answer2: "Nirvana", answer3: "Metallica", answer4: "AC/DC", correctAnswer: "Guns N' Roses"),
        Quiz(question: "Кто исполняет песню 'Shape of You'?", answer1: "Ed Sheeran", answer2: "Justin Bieber", answer3: "Drake", answer4: "Bruno Mars", correctAnswer: "Ed Sheeran")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kinoQuizImage.layer.cornerRadius = 25
        spaceQuizImage.layer.cornerRadius = 25
        musicQuizImage.layer.cornerRadius = 25
        buttonKinoQuiz.layer.cornerRadius = 25
        countKinoQuizQuestions.text = "вопросов: \(kinoQuiz.count)"
        counSpaceQuizQuestion.text = "вопросов: \(spaceQuiz.count)"
        countMusicQuizQuestion.text = "вопросов: \(musicQuiz.count)"
        kinoQuiz.shuffle()
        spaceQuiz.shuffle()
        musicQuiz.shuffle()
    }
    
    @IBAction func startKinoQuizButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              guard let quizViewController = storyboard.instantiateViewController(identifier: "QuizViewController") as? QuizViewController else { return }
        
        quizViewController.quizType = QuizType.filmQuiz
        quizViewController.questions = kinoQuiz
              
        navigationController?.pushViewController(quizViewController, animated: true)
    }
    
    @IBAction func startMusicQuizButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              guard let quizViewController = storyboard.instantiateViewController(identifier: "QuizViewController") as? QuizViewController else { return }
        
        quizViewController.quizType = QuizType.musicQuiz
        quizViewController.questions = musicQuiz
              
        navigationController?.pushViewController(quizViewController, animated: true)
    }
    
    @IBAction func startSpaceQuizButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              guard let quizViewController = storyboard.instantiateViewController(identifier: "QuizViewController") as? QuizViewController else { return }
        
        quizViewController.quizType = QuizType.spaceQuiz
        quizViewController.questions = spaceQuiz
              
        navigationController?.pushViewController(quizViewController, animated: true)
    }
}
