//
//  MoviesViewController.swift
//  Whatlaza
//
//  Created by Astronaut Elvis on 11/26/21.
//

import UIKit

// 12. After installing pods
import AlamofireImage

                                             // 4. Add interface (implementation)
class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 5.1 Click fix to add the implemented methods
    // Return the number of movie rows.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 6. return 50 for now
        return movies.count
    }
    
    // 5.2 Click fix the add the implemented methods
    // For this particular row, give me the cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create cell for demonstration
        
        // 10.1
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        //let cell = UITableViewCell()
        
        // 7. Lets print the movie title instead.
        let movie = movies[indexPath.row]
        // 8. Whats the title of the movie?
        let title = movie["title"] as! String
        
        // 10.3
        let synopsis = movie["overview"] as! String
        
        
        // Configure the cell
        // Swift optionals (?, !)
        //cell.textLabel!.text = title
        //cell.textLabel!.text = "row: \(indexPath.row)"
        
        //10.2 set the title
        cell.titleLabel.text = title
        // 10.3 set the overview
        cell.synopsisLabel.text = synopsis
        
        //11.1 Set the poster path
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        // 11.2 add the image to your poster
        
        
        // 12 After importing the AlamofireImage we can update the cell poster
        cell.posterView.af_setImage(withURL: posterUrl!)
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    // 2. create a varable of array of dictionary type
    // Properties available for the lifetime of the screen
    var movies = [[String:Any]]()
        
    // 1. Add the block of code from section 2
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 6.
        tableView.dataSource = self
        tableView.delegate = self
        
        print("Hello")
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                 // we have downloaded the movies, download is complete
                 self.movies = dataDictionary["results"] as! [[String:Any]]
                 
                 // 8. We need to continually call table view functions
                 // calls the function again
                 self.tableView.reloadData()
                 
                 // 3. Print the data Dictionary movie API
                 print(dataDictionary)
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
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
