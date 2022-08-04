//
//  OnlineRecipesContainer.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit
import Alamofire

class OnlineRecipesContainer {
    static let shared = OnlineRecipesContainer()

    private var cachedRecipes = [Recipe]()
    private var cache2 = [Recipe]()
    private var cachedIds = [UUID: String]()
    weak var delegate: OnlineRecipeDelegate?

    private init () {
        cachedRecipes = setupBasicRecipes()
        //        postAllPotions()
        fetchData()
    }

    func getAllOnlineRecipes() -> [Recipe] {
        return cachedRecipes
    }

    func findRecipe(id: UUID) -> Recipe? {
        guard let index = cachedRecipes.firstIndex(
            where: {$0.id == id}) else {
            fatalError("No such potion found")
        }

        return cachedRecipes[index]
    }

    func addOnlineRecipe(recipe: Recipe) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            var tempRecipe = recipe
            tempRecipe.local = false
            self?.cachedRecipes.append(tempRecipe)

            DispatchQueue.main.async {
                self?.delegate?.recipeDidUpload()
            }

            return
        }
    }

    func fetchData() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            AF.request("https://crudcrud.com/api/f1f20c79aaba4ac7a5630adc85950882/recipes/").validate(statusCode: 200 ..< 299).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoded = try JSONDecoder().decode([OnlineRecipe].self, from: data)

                        self?.cachedRecipes = decoded.map { return Recipe(id: $0.id, local: $0.local, ingredientsInRecipe: $0.ingredientsInRecipe, potionsInRecipe: $0.potionsInRecipe) }

                        for recipe in decoded {
                            self?.cachedIds[recipe.id] = recipe._id
                        }

                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                case .failure(let error):
                    print(error)
                }
            }

            DispatchQueue.main.async {
                self?.delegate?.recipesDidUpdate()
            }
        }
    }

    func postAllPotions () {
        for recipe in cachedRecipes {
            AF.request("https://crudcrud.com/api/f1f20c79aaba4ac7a5630adc85950882/recipes", method: .post, parameters: recipe, encoder: .json, headers: ["Content-Type": "application/json; charset=utf-8", "Access-Control-Allow-Methods": "*"]).validate(statusCode: 200 ..< 299).responseData {response in
                switch response.result {
                case .success(_):
                    print("Success")
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct OnlineRecipe: Codable {
    var id: UUID
    var _id: String
    var local: Bool
    var ingredientsInRecipe: [Potion]
    var potionsInRecipe: [Potion]
}
