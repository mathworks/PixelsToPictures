function encrypted = SwapCipher(sentence)
    words = strsplit(sentence);
    reversedWords = cellfun(@(word) word(end:-1:1), words, 'UniformOutput', false);
    encrypted = strjoin(reversedWords, ' ');
end