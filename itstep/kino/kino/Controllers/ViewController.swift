//
//  ViewController.swift
//  kino
//
//  Created by dan on 04.05.2023.
//

import UIKit
import Alamofire
import Kingfisher



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    private var moviesArray: [MovieEntity.Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let TRENDING_MOVIES_URL: String = "https://api.themoviedb.org/3/trending/movie/week"
    private let API_KEY: String = "71c5f8ef30fef8f804a20450b817bb2b"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: MovieCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MovieCell.identifier)
        
        
        getMovies()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        
        
        let movie = moviesArray[indexPath.row]
        let urlImage = URL(string: "https://image.tmdb.org/t/p/w300\(movie.posterPath ?? "")")
        cell.posterImageView.kf.setImage(with: urlImage)
        cell.originalTitleLabel.text = movie.originalTitle
        cell.releaseDate.text = movie.releaseDate
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    func getMovies() {
        var params: [String: Any] = ["api_key": API_KEY]
        
        AF.request(TRENDING_MOVIES_URL, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(_):
                do {
                    if let data = response.data {
                        let json = try JSONDecoder().decode(MovieEntity.self, from: data)
//                        print(json)
                        self.moviesArray = self.moviesArray + json.results
//                        print(self.moviesArray)
                    }
                }
                catch let movieError {
                    print(movieError)
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }


}

