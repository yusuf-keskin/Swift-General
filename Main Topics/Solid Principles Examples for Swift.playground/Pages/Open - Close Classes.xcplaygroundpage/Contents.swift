import Foundation

// Seperately created classes for to being use in another class

class RawFood {
    var fruit : String
    
    init(fruit : String) {
        self.fruit = fruit
    }

    func printDetails () -> String {
        return "This \(fruit) is delicious"
    }
}

class FriedFood  {
    var vegetable : String
    var oil : String
    
    init(vegetable : String, oil: String) {
        self.vegetable = vegetable
        self.oil = oil
    }
    
    
    func printDetails () -> String {
        return "You can cook \(vegetable) and \(oil) together"
    }
}

// Two functions for same job! Class func modified for added FriedFood class!

class GiveIngredient {
    
    func printIngredients() {
        let rawFood = [
            RawFood(fruit: "Apple"),
            RawFood(fruit: "Vine"),
            RawFood(fruit: "Banana")
        ]
        
        rawFood.forEach { raw in
            raw.printDetails()
        }
    
        // New added modification for later added FriedFood class
        
        let friedFoods = [
            FriedFood(vegetable: "Potato", oil: "Sunflower Oil"),
            FriedFood(vegetable: "Tomato", oil: "Butter")
        ]
        
        friedFoods.forEach { fried in
            fried.printDetails()
        }
        
        
    }
}


// Solution : Protocol func with different implemention in differen classes


// 1. Define Protocol

protocol Edible {
    func printIngredients() -> String
}

//2. Conform classes to protocol

class RawFood2: Edible {
    
    func printIngredients() -> String {
        return "This \(fruit) is delicious"
    }
    
    var fruit : String
    
    init(fruit : String) {
        self.fruit = fruit
    }

}

class FriedFood2: Edible  {
    
    func printIngredients() -> String {
        return "You can cook \(vegetable) and \(oil) together"
    }
    
    var vegetable : String
    var oil : String
    
    init(vegetable : String, oil: String) {
        self.vegetable = vegetable
        self.oil = oil
    }
 
}

// 3. Create objects as edible and do the job at once!

class GiveIngredient2 {
    
    func printIngredients() {
        let food : [Edible] = [
            RawFood2(fruit: "Apple"),
            RawFood2(fruit: "Vine"),
            RawFood2(fruit: "Banana"),
            FriedFood2(vegetable: "Potato", oil: "Sunflower Oil"),
            FriedFood2(vegetable: "Tomato", oil: "Butter")
        ]
        
        
        food.forEach { raw in
            raw.printIngredients()
        }
    }
}




