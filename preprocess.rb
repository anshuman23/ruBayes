
module Processor

def Processor.processIt!

    trainingData = Hash.new
    
    inputs = gets.chomp
    inputs.split.each do |className|
      trainingData[className] = []
    end
       
    #trainingData = {"1" => [], "2" => [] }
    
    File.foreach('train/train2.csv') do |line|   #Make changes here to add your own file. Replace train.csv

      inputDataRow = line.split(',')
      className = inputDataRow.pop.chomp
      inputDataRow.map {|i| i.to_f}
      
      trainingData[className].push(inputDataRow)

    end
      
    counter = 0
    total = 0
    
    nbc = Classifier.new(trainingData)

    File.foreach('test/test2.csv') do |line|       #Make changes here to add your own file. Replace test.csv
      dataToClassify = line.split(',')
      correctClassName = dataToClassify.pop.chomp
      dataToClassify = dataToClassify.map(&:to_f)
      # features.map {|feature| feature.to_f}
      
      className = nbc.classifyIt!(dataToClassify)
      
      if className == correctClassName
        counter += 1
        total += 1
        
      else total += 1
        
      end
      
    end

    total = total.to_f
    accuracy = (counter/total)*100.0
    puts "Accuracy of RuBayes Multiclass Classifier is: " +  accuracy.to_s + "%"

  end

end      
    
    
    
