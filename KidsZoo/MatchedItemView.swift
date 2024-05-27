//
//  MatchedItemView.swift
//  KidsZoo
//
//  Created by Doğu GNR on 12.03.2024.
//


import SwiftUI

struct MatchedItemView: View {
    let animalArrayImageName: [String]
    let gridLayoutColumns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var arrayOfTappedItem: Set<Int> = []
    @State private var arrayOfAllCorrectItem: Set<Int> = []
    @State private var shuffledAnimalArrayImageName: [String] = []

    init() {
        var shuffledArray = Array(repeating: "", count: 12)
        let animals = ["cat", "fox", "lion", "rakoon", "shark", "tiger"]
        var animalCounts = [String: Int]()
        for animal in animals {
            animalCounts[animal] = 0
        }

        var index = 0
        while index < 12 {
            let randomIndex = Int.random(in: 0..<12)
            if shuffledArray[randomIndex] == "" {
                let randomAnimal = animals.randomElement()!
                if animalCounts[randomAnimal]! < 2 {
                    shuffledArray[randomIndex] = randomAnimal
                    animalCounts[randomAnimal]! += 1
                    index += 1
                }
            }
        }

        shuffledAnimalArrayImageName = shuffledArray
        animalArrayImageName = shuffledArray.map { "\($0)" }
    }
    
    var body: some View {
        LazyVGrid(columns: gridLayoutColumns) {
            ForEach(0..<12) { index in
                Button(action: {
                    if arrayOfTappedItem.count < 2 && !arrayOfAllCorrectItem.contains(index) {
                        arrayOfTappedItem.insert(index)
                        if arrayOfTappedItem.count == 2 {
                            let firstIndex = arrayOfTappedItem.first!
                            let secondIndex = arrayOfTappedItem.dropFirst().first!

                            if shuffledAnimalArrayImageName[firstIndex] == shuffledAnimalArrayImageName[secondIndex] {
                                arrayOfAllCorrectItem.formUnion(arrayOfTappedItem)
                                arrayOfTappedItem = []

                                if arrayOfAllCorrectItem.count == 12 {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        arrayOfTappedItem = []
                                        arrayOfAllCorrectItem = []
                                        shuffledAnimalArrayImageName.shuffle()
                                    }
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                    arrayOfTappedItem = []
                                }
                            }
                        }
                    }
                }) {
                    Image(shuffledAnimalArrayImageName[index])
                        .resizable()
                        .frame(width: 90, height: 90, alignment: .center)
                        .padding(5)
                        .background(Color("AccentColor"))
                        .cornerRadius(50)
                        .overlay(Color("AccentColor").cornerRadius(50).opacity(!arrayOfTappedItem.contains(index) && !arrayOfAllCorrectItem.contains(index) ? 1 : 0))
                }
            }
        }
    }
}

struct MatchedItemView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedItemView()
    }
}
