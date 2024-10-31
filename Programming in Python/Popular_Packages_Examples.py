import numpy as np
import pandas as pd
import nltk
import nltk
nltk.download('punkt_tab')
from nltk.tokenize import word_tokenize, sent_tokenize
from nltk.corpus import stopwords

# Download necessary NLTK resources
nltk.download('punkt')
nltk.download('stopwords')

# Create an array of zeros
zeros_array = np.zeros(10)
print("Array of zeros:")
print(zeros_array)

# Create a 2x10 array filled with 0.7
filled_array = np.full((2, 10), 0.7)
print("\n2x10 array filled with 0.7:")
print(filled_array)

# Create evenly spaced numbers
even_spaced = np.linspace(0, 25, 6)
print("\nEvenly spaced numbers between 0 and 25:")
print(even_spaced)

# DataFrame example
data_a = {'Animals': ['Dog', 'Cat', 'Lion', 'Cow', 'Elephant'],
           'Sounds': ['Barks', 'Meow', 'Roars', 'Moo', 'Trumpet']}
df_a = pd.DataFrame(data_a)
print("\nDataFrame of Animals and Sounds:")
print(df_a)

# Statistical summary of DataFrame 'a'
print("\nStatistical summary of DataFrame 'a':")
print(df_a.describe(include='all'))

# DataFrame with sorting and new column
data_b = {'Letters': ['a', 'b', 'c', 'd', 'e', 'f'],
           'Numbers': [12, 7, 9, 3, 5, 1]}
df_b = pd.DataFrame(data_b)
df_b = df_b.sort_values(by='Numbers')
print("\nDataFrame 'b' sorted by Numbers:")
print(df_b)

# Add new_values column
df_b['new_values'] = df_b['Numbers'] * 3
print("\nDataFrame 'b' with new_values column:")
print(df_b)

# Tokenization example
text = "Hello world! This is a test of word tokenization."

try:
    print("\nWord Tokenization:")
    stopwords_list = set(stopwords.words('english'))
    new_text = [word for word in word_tokenize(text) if word.lower() not in stopwords_list]
    print(new_text)
except Exception as e:
    print("Error during word tokenization:", e)

try:
    print("\nSentence Tokenization:")
    sentences = sent_tokenize(text)
    print(sentences)
except Exception as e:
    print("Error during sentence tokenization:", e)

# Output

# PS C:\Users\hirew\OneDrive\Desktop\Meta Data Engineer> python -u "c:\Users\hirew\OneDrive\Desktop\Meta Data Engineer\Programming in Python\Popular_Packages_Examples.py"
# [nltk_data] Downloading package punkt_tab to
# [nltk_data]     C:\Users\hirew\AppData\Roaming\nltk_data...
# [nltk_data]   Unzipping tokenizers\punkt_tab.zip.
# [nltk_data] Downloading package punkt to
# [nltk_data]     C:\Users\hirew\AppData\Roaming\nltk_data...
# [nltk_data]   Package punkt is already up-to-date!
# [nltk_data] Downloading package stopwords to
# [nltk_data]     C:\Users\hirew\AppData\Roaming\nltk_data...
# [nltk_data]   Package stopwords is already up-to-date!
# Array of zeros:
# [0. 0. 0. 0. 0. 0. 0. 0. 0. 0.]

# 2x10 array filled with 0.7:
# [[0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7]
#  [0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7]]

# Evenly spaced numbers between 0 and 25:
# [ 0.  5. 10. 15. 20. 25.]

# DataFrame of Animals and Sounds:
#     Animals   Sounds
# 0       Dog    Barks
# 1       Cat     Meow
# 2      Lion    Roars
# 3       Cow      Moo
# 4  Elephant  Trumpet

# Statistical summary of DataFrame 'a':
#        Animals Sounds
# count        5      5
# unique       5      5
# top        Dog  Barks
# freq         1      1

# DataFrame 'b' sorted by Numbers:
#   Letters  Numbers
# 5       f        1
# 3       d        3
# 4       e        5
# 1       b        7
# 2       c        9
# 0       a       12

# DataFrame 'b' with new_values column:
#   Letters  Numbers  new_values
# 5       f        1           3
# 3       d        3           9
# 4       e        5          15
# 1       b        7          21
# 2       c        9          27
# 0       a       12          36

# Word Tokenization:
# ['Hello', 'world', '!', 'test', 'word', 'tokenization', '.']

# Sentence Tokenization:
# ['Hello world!', 'This is a test of word tokenization.']
