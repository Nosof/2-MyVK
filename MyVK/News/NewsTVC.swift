//
//  NewsTVC.swift
//  MyVK
//
//  Created by Валерий on 19.01.2021.
//

import UIKit

class NewsTVC: UITableViewController {
    
    private var news = [
        News(label: "Сериал закрывается! 23 сезон «Южного парка» может стать последним",
             text: "Официальный аккаунт сериала в Twitter опубликовал 15-секундный тизер 22 сезона, хотя в нем не было ни одного из популярных анимированных персонажей или кадра из новых эпизодов. Нет, вместо всего этого видео просто говорит, что сериал будет отменен.",
             image: UIImage (named: "news_01")!),
        News(label: "Обзор South Park: The Fractured But Whole. Лучшая игра по сериалу",
             text: "Вышедшая в 2014 году «South Park: Палка истины» казалась идеальной игрой по сериалу. Проект включал не только знакомый стиль, любимых персонажей и интересную историю, но и неплохой игровой процесс. Сиквел выглядит как логичная эволюция идей оригинала.",
             image: UIImage (named: "news_02")!),
        News(label: " Мнения игроков о South Park Fractured but Whole. Как с юмором и лучше ли первой игры?",
             text: "17 октября в продажу поступила South Park: Fractured but Whole, которую в последний раз перенесли на целый год. Пошел ли перенос на пользу? Судя по всему, не совсем.Критики тепло приняли новую игру по «Южному парку» и выставили в среднем 8/10. С их мнениями можно ознакомиться по ссылке, а ниже мы собрали впечатления простых пользователей.Многие остались недовольны простой боевой системой, а также скудной прокачкой. Отмечается, что игра осталась на уровне первой части «Палка судьбы», тем не менее, шутки до сих пор хороши.",
             image: UIImage (named: "news_03")!)
      ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as! NewsTVCell

       let index = news[indexPath.row]
        let label = index.label
        let image = index.image

        cell.newsLabel.text = label
        cell.newsImg.image = image

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }

}
