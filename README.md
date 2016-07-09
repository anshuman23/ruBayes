# ruBayes
###### copyright Anshuman Chhabra (2016)

- ruBayes is a script that allows you to perform multi class classification on most datasets (usually, smaller work better). The ones I have used here come from the [UCL Machine Learning Repository](http://archive.ics.uci.edu/ml/)

##### Dependencies
 - ruBayes uses the ```descriptive_statistics``` rubygem.
 - install it using ```gem install descriptive_statistics``` in terminal.


### Usage

- Run ruBayes.rb in terminal using ```ruby ruBayes.rb```
- You will now have to enter the names of the classes for classification. For example, in test2.csv and train2.csv the classification is made between Iris-setosa, Iris-versicolor and Iris-virginica. So you will enter ```Iris-setosa Iris-versicolor Iris-virginica``` at the prompt

- The code will output an accuracy based on the number of classifications it got correct. For the tested data for both sets, ruBayes got above 92% accuracy.

- The datasets for training and testing are placed in the train and test folders respectively

- The data needs to be formatted in a particular way. Although, most UCI ML datasets are formatted this way by default so just downloading a dataset from there and going ahead with the script shouldn't be a problem.

- To add your own test and train csv files just replace them in their respective folders. Make sure if you change the name from test.csv/train.csv or test2.csv/train2.csv you also make the requisite changes to the preprocess.rb file. It basically processes the files and the data in them and feeds it to ruBayes.

### Links

- The datasets used are [Haberman's survival (dataset1)](https://archive.ics.uci.edu/ml/datasets/Haberman%27s+Survival) and [Iris (dataset2)](https://archive.ics.uci.edu/ml/datasets/Iris).


