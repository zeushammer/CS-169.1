def combine_anagrams(words)
wordhash = Hash.new
words.each do |word| 
    if wordhash.has_value?(word.downcase.chars.sort.join) == true
        #do nothing
    else
     wordhash[word.downcase.chars.sort.join] = word
    end
 end
#for each word check if already a key in hash table, if so then access value and check if value already exists, if it does, ignore the word and move on, if it doesn't insert the word.
return wordhash
end

combine_anagrams(['cars', 'for', 'For','potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])