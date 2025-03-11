package main

//imports necessary 
import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

//read all the words in the file and store them in a map with the word as the key and true as the value representing the word is present
func loadWords(filename string) (map[string] bool, error){
	//map to hold words
	words := make(map[string]bool)
	//file var and err var in case of errors
	file, err := os.Open(filename)
	//check for errors
	if err != nil{
		return nil, err
	}
	//make sure we close the file when done
	defer file.Close()
	//initialize a scanner to read from the file
	scanner := bufio.NewScanner(file)
	//loop through the file until all words are read and stored in words map
	for scanner.Scan(){
		//remove any whitespace
		word := strings.TrimSpace(scanner.Text())
		words[word] = true
	}
	//check for errors
	if err := scanner.Err(); err != nil {
		return nil, err
	}

	//return the words from the file stored in the map
	return words, nil

}

//recursive permutation builder
func getPermutations(input string, minLen, maxLen int, temp string, used []bool, results *map[string]bool) {
	//check current length of permutation (temp)
	if len(temp) >= minLen && len(temp) <= maxLen {
		(*results)[temp] = true
	}

	//return if max size
	if len(temp) == maxLen {
		return
	}

	
	for i := 0; i < len(input); i++ {
		//check if letter has been used in the current permutation
		if used[i] {
			continue
		}
		used[i] = true
		//recursive call to getPermutations
		getPermutations(input, minLen, maxLen, temp+string(input[i]), used, results)
		used[i] = false
	}
}

// FindValidWords finds valid words in the dictionary from generated permutations
func FindWords(letters string, words map[string]bool) {
	permutations := make(map[string]bool)
	used := make([]bool, len(letters))
	getPermutations(letters, 3, len(letters), "", used, &permutations)

	fmt.Println("Valid words found:")
	for word := range permutations {
		if words[word] {
			fmt.Println(word)
		}
	}
}

//main function
func main(){
	//input string 
	var chars string
	//file to read holding the words
	fin := "fin.txt"
	//load the words
	words, err := loadWords(fin)
	//check for error while reading file
	if err != nil {
		fmt.Println("Error loading words:", err)
		return
	}

	//get the input string from the user and store them in chars
	fmt.Print("Enter 3 to 7 letters: ")
	fmt.Scanln(&chars)
	//convert all letters to lowercase and remove any whitespace
	chars = strings.ToLower(strings.TrimSpace(chars))

	//validate input length
	if len(chars) < 3 || len(chars) > 7 {
		fmt.Println("Error: Input must be between 3 and 7 letters.")
		return
	}
	
	//call find words to check permutations from getPermutations against the map of words read from fin.txt
	FindWords(chars, words)

}