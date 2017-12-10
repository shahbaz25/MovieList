//
//  MovieListModel.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// MovieList Networking model

import Foundation
import ObjectMapper

class MovieListModel: NSObject, NSCoding, Mappable {
    
    var error : String?
    var errorMessage : String?
    var response: [MovieDetails]?
    
    class func newInstance(map : Map) -> Mappable? {
        return MovieListModel(map: map)
    }
    
    required init?(map _: Map) {}
    private override init() {}
    
    static func mappedMovieListModel(_ dict: Dictionary<String, AnyObject>) -> MovieListModel {
        return Mapper<MovieListModel>().map(JSON: dict)! as MovieListModel
    }
    
    func mapping(map: Map) {
        error <- map["Error"]
        errorMessage <- map["ErrorMessage"]
        response <- map["response"]
    }
    
    @objc required init(coder aDecoder: NSCoder) {
        error = aDecoder.decodeObject(forKey: "Error") as? String
        errorMessage = aDecoder.decodeObject(forKey: "ErrorMessage") as? String
        response = aDecoder.decodeObject(forKey: "response") as? [MovieDetails]
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder) {
        if error != nil {
            aCoder.encode(error, forKey: "Error")
        }
        if errorMessage != nil {
            aCoder.encode(errorMessage, forKey: "ErrorMessage")
        }
        if response != nil {
            aCoder.encode(response, forKey: "response")
        }
    }
}


class MovieDetails: NSObject, NSCoding,Mappable {
    
    var actors : String?
    var awards : String?
    var boxOffice : String?
    var country : String?
    var dVD : String?
    var director : String?
    var genre : String?
    var language : String?
    var metascore : String?
    var plot : String?
    var poster : String?
    var production : String?
    var rated : String?
    var released : String?
    var response : Bool?
    var runtime : String?
    var title : String?
    var type : String?
    var website : String?
    var writer : String?
    var year : String?
    var imdbID : String?
    var imdbRating : String?
    var imdbVotes : String?
    
    class func newInstance(map : Map) -> Mappable? {
        return MovieDetails(map: map)
    }
    
    required init?(map: Map){}
    private override init(){}
    
    static func mappedMovieDetails(_ dict: Dictionary<String, AnyObject>) -> MovieDetails {
        return Mapper<MovieDetails>().map(JSON: dict)! as MovieDetails
    }
    
    func mapping(map: Map) {
        actors <- map["Actors"]
        awards <- map["Awards"]
        boxOffice <- map["BoxOffice"]
        country <- map["Country"]
        dVD <- map["DVD"]
        director <- map["Director"]
        genre <- map["Genre"]
        language <- map["Language"]
        metascore <- map["Metascore"]
        plot <- map["Plot"]
        poster <- map["Poster"]
        production <- map["Production"]
        rated <- map["Rated"]
        released <- map["Released"]
        response <- map["Response"]
        runtime <- map["Runtime"]
        title <- map["Title"]
        type <- map["Type"]
        website <- map["Website"]
        writer <- map["Writer"]
        year <- map["Year"]
        imdbID <- map["imdbID"]
        imdbRating <- map["imdbRating"]
        imdbVotes <- map["imdbVotes"]
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        actors = aDecoder.decodeObject(forKey: "Actors") as? String
        awards = aDecoder.decodeObject(forKey: "Awards") as? String
        boxOffice = aDecoder.decodeObject(forKey: "BoxOffice") as? String
        country = aDecoder.decodeObject(forKey: "Country") as? String
        dVD = aDecoder.decodeObject(forKey: "DVD") as? String
        director = aDecoder.decodeObject(forKey: "Director") as? String
        genre = aDecoder.decodeObject(forKey: "Genre") as? String
        language = aDecoder.decodeObject(forKey: "Language") as? String
        metascore = aDecoder.decodeObject(forKey: "Metascore") as? String
        plot = aDecoder.decodeObject(forKey: "Plot") as? String
        poster = aDecoder.decodeObject(forKey: "Poster") as? String
        production = aDecoder.decodeObject(forKey: "Production") as? String
        rated = aDecoder.decodeObject(forKey: "Rated") as? String
        released = aDecoder.decodeObject(forKey: "Released") as? String
        response = aDecoder.decodeObject(forKey: "Response") as? Bool
        runtime = aDecoder.decodeObject(forKey: "Runtime") as? String
        title = aDecoder.decodeObject(forKey: "Title") as? String
        type = aDecoder.decodeObject(forKey: "Type") as? String
        website = aDecoder.decodeObject(forKey: "Website") as? String
        writer = aDecoder.decodeObject(forKey: "Writer") as? String
        year = aDecoder.decodeObject(forKey: "Year") as? String
        imdbID = aDecoder.decodeObject(forKey: "imdbID") as? String
        imdbRating = aDecoder.decodeObject(forKey: "imdbRating") as? String
        imdbVotes = aDecoder.decodeObject(forKey: "imdbVotes") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if actors != nil{
            aCoder.encode(actors, forKey: "Actors")
        }
        if awards != nil{
            aCoder.encode(awards, forKey: "Awards")
        }
        if boxOffice != nil{
            aCoder.encode(boxOffice, forKey: "BoxOffice")
        }
        if country != nil{
            aCoder.encode(country, forKey: "Country")
        }
        if dVD != nil{
            aCoder.encode(dVD, forKey: "DVD")
        }
        if director != nil{
            aCoder.encode(director, forKey: "Director")
        }
        if genre != nil{
            aCoder.encode(genre, forKey: "Genre")
        }
        if language != nil{
            aCoder.encode(language, forKey: "Language")
        }
        if metascore != nil{
            aCoder.encode(metascore, forKey: "Metascore")
        }
        if plot != nil{
            aCoder.encode(plot, forKey: "Plot")
        }
        if poster != nil{
            aCoder.encode(poster, forKey: "Poster")
        }
        if production != nil{
            aCoder.encode(production, forKey: "Production")
        }
        if rated != nil{
            aCoder.encode(rated, forKey: "Rated")
        }
        if released != nil{
            aCoder.encode(released, forKey: "Released")
        }
        if response != nil{
            aCoder.encode(response, forKey: "Response")
        }
        if runtime != nil{
            aCoder.encode(runtime, forKey: "Runtime")
        }
        if title != nil{
            aCoder.encode(title, forKey: "Title")
        }
        if type != nil{
            aCoder.encode(type, forKey: "Type")
        }
        if website != nil{
            aCoder.encode(website, forKey: "Website")
        }
        if writer != nil{
            aCoder.encode(writer, forKey: "Writer")
        }
        if year != nil{
            aCoder.encode(year, forKey: "Year")
        }
        if imdbID != nil{
            aCoder.encode(imdbID, forKey: "imdbID")
        }
        if imdbRating != nil{
            aCoder.encode(imdbRating, forKey: "imdbRating")
        }
        if imdbVotes != nil{
            aCoder.encode(imdbVotes, forKey: "imdbVotes")
        }
        
    }
}

