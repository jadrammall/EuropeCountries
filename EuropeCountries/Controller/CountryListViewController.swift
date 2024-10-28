//
//  ViewController.swift
//  EuropeCountries
//
//  Created by Jad Rammal on 28/10/2024.
//

import UIKit

class CountryListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var CountryListCollectionView: UICollectionView!
    
    var countryList: [CountryResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CountryListCollectionView.dataSource = self
        CountryListCollectionView.delegate = self
        
        let nib = UINib(nibName: "CountryListCollectionViewCell", bundle: nil)
        CountryListCollectionView.register(nib, forCellWithReuseIdentifier: "CountryListCollectionViewCell")
        
        getCountriesFromServer()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryListCollectionViewCell", for: indexPath) as! CountryListCollectionViewCell
        
        let country = countryList[indexPath.item]
        
        cell.setup(country: country)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 124, height: 124)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let country = countryList[indexPath.item]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let destination = storyboard.instantiateViewController(withIdentifier: "CountryMapViewController") as! CountryMapViewController

        destination.urlString = country.maps.googleMaps

        navigationController?.pushViewController(destination, animated: true)
    }
    
    func getCountriesFromServer() {
        let urlString = "https://restcountries.com/v3.1/region/europe"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data found")
                return
            }
            
            do {
                let countryResponse = try JSONDecoder().decode([CountryResult].self, from: data)
                self.countryList = countryResponse
                
                DispatchQueue.main.async {
                    self.CountryListCollectionView.reloadData()
                }
            } catch let decodingError {
                print("Error couldn't retreive data: \(decodingError)")
            }
        }.resume()
    }
    
}

