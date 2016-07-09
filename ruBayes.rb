
# Multi-class Classification using Naive Bayes' Theorem

$LOAD_PATH << '.'
require 'descriptive_statistics'
require 'preprocess.rb'

class Classifier

  def initialize(trainingDataset)  #trainingDataset is a Hash of classes, where each class contains an Array / 2-D Matrix of traning data. A row represents a single example
    @trainingDataset = trainingDataset
    @classes = @trainingDataset.keys
    @totalClasses = @trainingDataset.size
  end

  #Now, we will write code for a method that can isolate a single column of the data matrix,(that is, all the data for a particular feature) that belongs to a particular class. After that, we determine the Gaussian probability of belonging to this feature vector for a single element.

  def calculateProbability(classType,index,element)

    classDataset =  @trainingDataset[classType]
   
    featureVector = classDataset.transpose[index]   
    
    featureVectorMean = featureVector.mean
    featureVectorSD = featureVector.standard_deviation  
    featureVectorVar = featureVector.variance

    probability =  (1.0/(Math.sqrt(2*(Math::PI)*featureVectorVar))) * ((Math::E)**(-((element - featureVectorMean)**2)/(2*featureVectorVar)))

    if featureVectorSD == 0
      if featureVectorMean == element
        return 1.0

      else return 0.0
      end

    else return probability
    end

  end



  def findProbability(featureRow, classType)

    idx = 0
    multiplier = 1.0
    
    featureRow.each do |featureRowElement|

      multiplier *= calculateProbability(classType,idx,featureRowElement)
      idx += 1

    end

    return (multiplier * (1.0/@totalClasses))

  end


  def classifyIt!(featureRow)

    temp = Hash.new
    
    @classes.each do |classType|
      temp[classType] = findProbability(featureRow,classType)
    end

    max = temp.values.max
    return temp.key(max)
        
  end



end


Processor.processIt!

  

    
  
